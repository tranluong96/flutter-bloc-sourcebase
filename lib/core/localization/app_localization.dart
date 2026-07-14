import 'package:flutter/material.dart';
import 'package:my_app/i18n/strings.g.dart';

/// Lớp bọc mỏng quanh slang. Đọc bản dịch qua `Translations.of(context)` để
/// widget tự rebuild khi đổi ngôn ngữ (đồng bộ theo context). Giữ nguyên tên
/// getter cũ để không phải sửa toàn bộ call-site khi migrate từ easy_localization.
class AppLocalization {
  final Translations _t;

  AppLocalization(BuildContext context) : _t = Translations.of(context);

  static AppLocalization of(BuildContext context) => AppLocalization(context);

  // Common
  String get email => _t.common.email;
  String get emailRequired => _t.common.emailRequired;
  String get password => _t.common.password;
  String get passwordRequired => _t.common.passwordRequired;

  // Login
  String get loginTitle => _t.login.title;
  String get loginSignIn => _t.login.signIn;

  // Home
  String get home => _t.home.title;
  String get settings => _t.settings;
  String get language => _t.language;
  String get english => _t.english;
  String get japanese => _t.japanese;
  String get favorites => _t.favorites;
  String get notifications => _t.notifications;

  /// Đổi ngôn ngữ toàn app. slang phát tín hiệu rebuild cho mọi widget đang
  /// dùng `Translations.of(context)` / `context.t`.
  static Future<void> changeLanguage(String languageCode) {
    return LocaleSettings.setLocale(
      languageCode == 'en' ? AppLocale.en : AppLocale.ja,
    );
  }

  /// Ngôn ngữ hiện tại có phải English không.
  static bool get isEnglish => LocaleSettings.currentLocale == AppLocale.en;
}
