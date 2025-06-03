import 'package:injectable/injectable.dart';

@lazySingleton
class AppValidators {
  final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[^\s]{8,16}$');
  final emailRegex = RegExp(
      r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$');

  // validate email
  bool _isEmail(String text) {
    return emailRegex.hasMatch(text);
  }

  String? validateEmail(String value, String title) {
    return _isEmail(value) ? null : "loi";
  }

  // validate email
  bool _isPassword(String text) {
    return passwordRegex.hasMatch(text);
  }

  String? validatePassword(String value, String title) {
    return _isPassword(value)
        ? null
        : "loi";
  }
}
