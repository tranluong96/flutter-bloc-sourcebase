# Flutter App Base

A Flutter project template with optimized MVVM architecture using RxDart, localization, and dependency injection.

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- IDE (VS Code or Android Studio)

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate necessary files

## Project Structure

```
lib/
├── core/
│   ├── localization/
│   ├── theme/
│   └── utils/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── pages/
│   ├── main/
│   └── widgets/
└── main.dart
```

## Commands

### Generate Code

```bash
# Watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs
```

### Generate Language Files

```bash
# Generate language files from JSON
#!/bin/bash
flutter pub run easy_localization:generate -S assets/locales
flutter pub run easy_localization:generate -S assets/locales -f keys -o locale_keys.g.dart
```

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

- Default language: Japanese (ja)
- Supported languages: Japanese (ja), English (en)
- Translation files located in `assets/locale/`

## Theme

- Light and dark theme support
- Customizable color scheme
- Responsive design utilities
