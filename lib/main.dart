import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/core/blocs/app_bloc_observer.dart';
import 'package:my_app/core/utils/configs/enum.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/i18n/strings.g.dart';
import 'package:my_app/root/app.dart';

Future<void> mainCommon(AppFlavor flavor) async {
  await _setup();
  runApp(
    TranslationProvider(
      child: App(flavor: flavor),
    ),
  );
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Mặc định tiếng Nhật (base_locale = ja).
  LocaleSettings.setLocaleSync(AppLocale.ja);
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
}
