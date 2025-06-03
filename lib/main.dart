import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/core/utils/configs/enum.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/root/app.dart';

Future<void> mainCommon(AppFlavor flavor) async {
  await _setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      path: 'assets/locales',
      fallbackLocale: const Locale('ja'),
      startLocale: const Locale('ja'),
      child: App(flavor: flavor),
    ),
  );
}

Future<void> _setup() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  configureDependencies();
}
