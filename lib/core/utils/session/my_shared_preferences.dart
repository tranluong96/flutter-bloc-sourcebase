import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/models/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MySharedPreferencesRepository {
  Future<void> setAccessToken(String token);
  String get accessToken;
  Future<void> setRefreshToken(String token);
  String get refreshToken;

  Future<void> setDeviceToken(String token);
  String get deviceToken;

  Future<void> setUserAuth(User user);
  User getUserAuth();

  Future<void> clearAll();

  Future<bool> setString(String key, String value);
  String? getString(String key);
  Future<bool> remove(String key);
  Future<bool> clear();

  const MySharedPreferencesRepository();
}

@lazySingleton
class MySharedPreferences extends MySharedPreferencesRepository {
  final SharedPreferences _preferences;

  static const String prefix = 'auth';
  static const String _accessTokenKey = '${prefix}_access_token_key';
  static const String _refreshTokenKey = '${prefix}_refresh_token_key';
  static const String _deviceTokenKey = '${prefix}_device_token_key';
  static const String _userAuth = '${prefix}_user_auth';

  const MySharedPreferences(this._preferences);

  @override
  Future<void> clearAll() async {
    await _preferences.remove(_accessTokenKey);
  }

  @override
  Future<void> setAccessToken(String token) async {
    await _preferences.setString(_accessTokenKey, token);
  }

  @override
  String get accessToken => _preferences.getString(_accessTokenKey).content;

  @override
  String get refreshToken => _preferences.getString(_refreshTokenKey).content;

  @override
  Future<void> setRefreshToken(String token) async {
    await _preferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<void> setDeviceToken(String token) async {
    await _preferences.setString(_deviceTokenKey, token);
  }

  @override
  String get deviceToken => _preferences.getString(_deviceTokenKey).content;

  @override
  Future<void> setUserAuth(User user) async {
    await _preferences.setString(_userAuth, jsonEncode(user));
  }

  @override
  User getUserAuth() {
    final String response = _preferences.getString(_userAuth).content;
    Map<String, dynamic> user = jsonDecode(response);
    return User.fromJson(user);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  @override
  Future<bool> clear() async {
    return await _preferences.clear();
  }
}
