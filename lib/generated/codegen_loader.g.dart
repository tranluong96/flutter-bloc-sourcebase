// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ja = {
  "common": {
    "email": "メールアドレス",
    "email_required": "メールアドレスは必須です",
    "password": "パスワード",
    "password_required": "パスワードは必須です"
  },
  "login": {
    "title": "ログイン",
    "sign_in": "ログイン"
  },
  "home": {
    "title": "ホーム"
  },
  "settings": "設定",
  "language": "言語",
  "english": "英語",
  "japanese": "日本語",
  "favorites": "お気に入り",
  "notifications": "通知"
};
static const Map<String,dynamic> _en = {
  "common": {
    "email": "Email",
    "email_required": "Email is required",
    "password": "Password",
    "password_required": "Password is required"
  },
  "login": {
    "title": "Login",
    "sign_in": "Sign in"
  },
  "home": {
    "title": "Home"
  },
  "settings": "Settings",
  "language": "Language",
  "english": "English",
  "japanese": "Japanese",
  "favorites": "Favorites",
  "notifications": "Notifications"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ja": _ja, "en": _en};
}
