import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:my_app/core/blocs/app_bloc_providers.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/shared/global_overlay/global_overlay_host.dart';
import 'package:my_app/core/utils/configs/enum.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/i18n/strings.g.dart';
import 'package:my_app/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key, required this.flavor});
  final AppFlavor flavor;

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    //title app
    final appName = flavor == AppFlavor.development
        ? '[D]MyApp'
        : 'MyApp';

    return AppBlocProviders(
      child: KeyboardDismisser(
        gestures: const [GestureType.onTap],
        child: MaterialApp.router(
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: AppLocaleUtils.supportedLocales,
          // Đồng bộ locale của Flutter theo slang; rebuild khi đổi ngôn ngữ.
          locale: TranslationProvider.of(context).flutterLocale,
          title: appName,
          theme: ThemeData(
            // Color common app white
            scaffoldBackgroundColor: ResColors().white,
            fontFamily: "Noto Sans JP",
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            textButtonTheme: _textButtonTheme(context),
            outlinedButtonTheme: _outlineTextButtonTheme(context),
            inputDecorationTheme: _inputDecorationTheme(context),
            elevatedButtonTheme: _elevatedButtonTheme(context),
          ),
          routerConfig: appRouter.config(),
          // Host loading + toast toàn cục, nằm trên mọi màn hình.
          builder: (context, child) =>
              GlobalOverlayHost(child: child ?? const SizedBox.shrink()),
        ),
      ),
    );
  }

  OutlinedButtonThemeData _outlineTextButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        backgroundColor: ResColors().white,
        foregroundColor: ResColors().disabled,
        textStyle: ResTextStyles().medium16,
        alignment: Alignment.center,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 1,
            color: ResColors().primary,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  TextButtonThemeData _textButtonTheme(BuildContext context) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ResColors().white,
        backgroundColor: Colors.blue,
        textStyle: ResTextStyles().medium16,
        alignment: Alignment.center,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme(BuildContext context) {
    return InputDecorationTheme(
      fillColor: ResColors().white,
      filled: true,
      hintStyle:
          ResTextStyles().regular16.copyWith(color: ResColors().placeholder),
      errorStyle: ResTextStyles().regular14.copyWith(color: ResColors().error),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 1,
          color: ResColors().stroke,
          style: BorderStyle.solid,
        ),
      ),
      contentPadding: const EdgeInsets.all(12),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ResColors().stroke,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ResColors().error,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ResColors().error,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ResColors().stroke,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      errorMaxLines: 3,
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ResColors().primary,
        foregroundColor: ResColors().white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
