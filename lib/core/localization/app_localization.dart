import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/locale_keys.g.dart';
import 'package:my_app/core/localization/language_provider.dart';
import 'package:provider/provider.dart';

class AppLocalization {
  final BuildContext context;

  AppLocalization(this.context);

  static AppLocalization of(BuildContext context) {
    return AppLocalization(context);
  }

  // Common
  String get email => LocaleKeys.common_email.tr(context: context);
  String get emailRequired => LocaleKeys.common_email_required.tr(context: context);
  String get password => LocaleKeys.common_password.tr(context: context);
  String get passwordRequired => LocaleKeys.common_password_required.tr(context: context);
  

  // Login
  String get loginTitle => LocaleKeys.login_title.tr(context: context);
  String get loginSignIn => LocaleKeys.login_sign_in.tr(context: context);

  // Home
  String get home => LocaleKeys.home_title.tr(context: context);
  String get settings => LocaleKeys.settings.tr(context: context);
  String get language => LocaleKeys.language.tr(context: context);
  String get english => LocaleKeys.english.tr(context: context);
  String get japanese => LocaleKeys.japanese.tr(context: context);
  String get favorites => LocaleKeys.favorites.tr(context: context);
  String get notifications => LocaleKeys.notifications.tr(context: context);

  Future<void> changeLanguage(String languageCode) async {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    await languageProvider.changeLanguage(languageCode, context);
  }

  // Phương thức để thay đổi ngôn ngữ từ bất kỳ đâu trong ứng dụng
  static Future<void> changeLanguageGlobal(String languageCode, BuildContext context) async {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    await languageProvider.changeLanguage(languageCode, context);
  }
}
