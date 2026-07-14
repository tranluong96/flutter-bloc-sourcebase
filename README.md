# Flutter App Base

A Flutter project template built around **BLoC/Cubit** for state management, with
RxDart, localization (easy_localization), dependency injection (get_it/injectable),
and auto_route navigation. A lightweight `BasePage` + `BaseViewModel` (MVVM-style)
is also provided for simple screens that don't need a full BLoC.

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- IDE (VS Code or Android Studio)

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate necessary files
4. if use firebase for notification: `flutterfire configure` to generate necessary files

## Request Cancellation (CancelToken)

The boilerplate supports API request cancellation using Dio's `CancelToken`, managed by `CancelTokenManager` which uses **UUID v4** keys for precise control.

### 1. Define CancelToken in RestClient
Add the `@CancelRequest()` annotation to an optional `CancelToken` parameter in your `RestClient` method signature:

```dart
@POST(APPEndpoints.loginAPI)
Future<UserOutput> loginAPI(
  @Body() LoginInput input,
  @CancelRequest() CancelToken? cancelToken,
);
```

### 2. Global Error Interceptor Behavior
All cancelled requests (which throw a `DioException` of type `DioExceptionType.cancel`) are automatically handled in `GlobalUiInterceptor`:
- It **hides** the global loading indicator if it was shown (`ApiExtraKeys.showLoading: true`).
- It **bypasses** the global error toast popup, keeping the UX silent for intentional cancellations.

### 3. CancelTokenManager — UUID v4 based control

`CancelTokenManager` (`lib/core/utils/network/cancel_token_manager.dart`) is a singleton that maps UUID v4 keys to `CancelToken` instances.

| Method | Description |
|---|---|
| `register()` | Creates a new token, stores it, returns the UUID key |
| `get(key)` | Returns the token for a given key |
| `cancel(key, reason?)` | Cancels and removes a specific request by key |
| `remove(key)` | Removes a completed token (no cancel needed) |
| `cancelAll(reason?)` | Cancels all pending requests — e.g. on logout |

### 4. Usage Example

```dart
// In a BLoC or widget:

String? _requestKey;

// 1. Register a key + token before the request
_requestKey = CancelTokenManager.instance.register();

try {
  final response = await getIt<RestClient>().loginAPI(
    input,
    CancelTokenManager.instance.get(_requestKey!),
  );
  // On success, clean up the token
  CancelTokenManager.instance.remove(_requestKey!);
} on DioException catch (e) {
  if (CancelToken.isCancel(e)) {
    // Silently ignored by GlobalUiInterceptor
    // Handle in BLoC if needed (e.g. reset state)
  }
}

// 2. Cancel the specific request (e.g. user navigates away)
if (_requestKey != null) {
  CancelTokenManager.instance.cancel(_requestKey!, "User navigated away");
}

// 3. On logout — cancel ALL pending requests immediately
CancelTokenManager.instance.cancelAll("logout");
```


## Project Structure

```
lib/
├── core/
│   ├── blocs/          # AppBlocProviders (global blocs) + AppBlocObserver
│   ├── localization/   # AppLocalization, LanguageProvider
│   ├── models/
│   ├── resources/      # colors, text styles
│   ├── services/       # e.g. FCM push notification
│   ├── shared/         # shared widgets (loading, popup, ...)
│   ├── singletons/     # in-memory shared stores (DataServiceMgmt)
│   └── utils/          # network, session, helpers, extensions, ...
├── generated/          # generated code (assets, DI)
├── i18n/               # slang translations (*.i18n.json + strings.g.dart)
├── models/             # data models (json_serializable)
├── pages/
│   ├── auth/           # login
│   ├── base/           # BasePage / BaseViewModel / mixins
│   ├── main/           # bottom_bar, home, count, favorite, ...
│   ├── onboarding/
│   ├── splash/
│   ├── template/       # sample feature (bloc/state/event)
│   └── widgets/        # reusable UI widgets
├── routes/             # auto_route config (router.dart, router.gr.dart)
├── root/               # App widget (MaterialApp.router)
├── firebase_options.dart
└── main.dart           # main_development.dart / main_production.dart flavors
```

## Commands

### Generate Code

```bash
# Watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs
```

### Generate Language Files (slang)

Translations use **[slang](https://pub.dev/packages/slang)** (type-safe i18n).

- Source files: `lib/i18n/ja.i18n.json` (base = ja) and `lib/i18n/en.i18n.json`.
- Config: `slang.yaml` (`base_locale: ja`, output → `lib/i18n/strings.g.dart`).

```bash
# Regenerate translations after editing the .i18n.json files
dart run slang

# Watch mode
dart run slang watch
```

Usage:

```dart
// Reactive access (rebuilds on language change) — via context
final t = Translations.of(context); // or: context.t
Text(t.home.title);

// Change language app-wide
LocaleSettings.setLocale(AppLocale.en);
```

The app is wrapped with `TranslationProvider` in `main.dart`, and
`MaterialApp.router` reads its locale from `TranslationProvider.of(context)`.
A thin `AppLocalization` wrapper is kept for backward-compatible getters.

## Architecture
- use BLoC

1. **View (UI Layer)**
   - Pages and Widgets
   - Consumes BLoC states
   - Handles user interactions
   - Uses BlocBuilder for UI updates

2. **BLoC (Business Logic Layer)**
   - Manages state using Cubit/Bloc
   - Handles business logic
   - Communicates with Services
   - Implements error handling

3. **Service (Network Layer)**
   - Handles API calls
   - Manages network state
   - Returns data to BLoC

### BLoC scope & state lifecycle (important)

Follow these rules to avoid state leaking between screens/sessions:

- **Page-scoped by default.** Provide a screen's bloc inside that screen's
  `wrappedRoute` (via `getIt<XxxBloc>()` or `XxxBloc()`). auto_route disposes the
  bloc when the route is popped, so its state is cleared automatically.
- **Global only when truly shared.** Only put a bloc in
  `core/blocs/app_bloc_providers.dart` (mounted at the app root) if multiple
  screens genuinely share it (e.g. `TemplateBloc` used as a cross-screen bus).
  Global blocs live for the whole app lifetime and are **not** disposed on
  navigation — reset them explicitly when needed (e.g. on logout).
- **Clean up subscriptions.** Blocs mixing `DPDisposable` must call
  `cancelSubscriptions()` inside `close()`, and guard async `emit` with
  `if (!isClosed)`. In widgets, store any `StreamSubscription` and cancel it in
  `dispose()`, and check `mounted` before using `context` in async callbacks.
- **Shared in-memory data** (e.g. `DataServiceMgmt`) is reset on logout via
  `Session.logout()` → `DataServiceMgmt.clearAllData()`.
- **Observability.** `AppBlocObserver` (set in `main`) logs all bloc
  changes/errors through `LoggerHelper` — prefer it over `print`.

### Key Features

1. **State Management**
   - Clear state definitions
   - Type-safe state handling
   - Easy state transitions

2. **Error Handling**
   - Centralized error handling in BLoC
   - User-friendly error messages
   - Proper error states

3. **Performance**
   - Efficient state updates
   - Proper resource management
   - Optimized rebuilds

4. **Code Organization**
   - Clean architecture
   - Separation of concerns
   - Easy to test and maintain

## Dependency Injection

Using `get_it` for dependency injection:

```dart
@lazySingleton
class AuthRepository {
  const AuthRepository();
}
```

## Auto Route Navigation

1. Add `@RoutePage()` annotation to your pages
2. Implement `AutoRouteWrapper` for BLoC provider setup
3. Use `context.router` for navigation

```dart
@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: this,
    );
  }
}
```

## Localization

- Library: **slang** (type-safe, context-based reactive)
- Default language: Japanese (ja)
- Supported languages: Japanese (ja), English (en)
- Translation files located in `lib/i18n/` (`ja.i18n.json`, `en.i18n.json`)

## Theme

- Single light theme configured in `lib/root/app.dart` (`ThemeData`)
- Customizable color scheme via `core/resources/res_colors.dart`
- Responsive design utilities (`flutter_screenutil`)
