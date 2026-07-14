// Define a Settings model class
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/core/singletons/data_service_mgmt.dart';
import 'package:my_app/core/utils/session/my_shared_preferences.dart';
import 'package:my_app/models/auth/user_model.dart';

abstract class SessionProtocol extends ChangeNotifier {
  void login(String accessToken);
  void logout();

  void setUserAuth(User user);
  User getUserAuth();

  void setAccessToken(String token);

  void saveDeviceToken(String token);

  void setRefreshToken(String token);
}

@lazySingleton
class Session extends SessionProtocol {
  final MySharedPreferences _mySharedPreferences;
  Session(this._mySharedPreferences);
  bool get hasLogin => accessToken.isNotEmpty;
  String get accessToken => _mySharedPreferences.accessToken;
  String get refreshToken => _mySharedPreferences.refreshToken;
  String get deviceToken => _mySharedPreferences.deviceToken;

  @override
  void login(String accessToken) {
    _mySharedPreferences.setAccessToken(accessToken);
  }

  @override
  void logout() {
    _mySharedPreferences.clearAll();
    // Reset dữ liệu in-memory dùng chung để không rớt sang phiên/người dùng sau.
    DataServiceMgmt.instance.clearAllData();
  }

  @override
  void saveDeviceToken(String token) async {
    await _mySharedPreferences.setDeviceToken(token);
  }

  @override
  void setAccessToken(String token) {
    _mySharedPreferences.setAccessToken(token);
  }

  @override
  void setRefreshToken(String token) {
    _mySharedPreferences.setRefreshToken(token);
  }

  @override
  void setUserAuth(User user) {
    _mySharedPreferences.setUserAuth(user);
  }

  @override
  User getUserAuth() {
    return _mySharedPreferences.getUserAuth();
  }

  Future<void> clearAll() async {
    await _mySharedPreferences.clearAll();
    DataServiceMgmt.instance.clearAllData();
  }
}
