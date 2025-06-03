import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/core/utils/network/env_keys.dart';

abstract class APPEndpoints {
  static final String? BASE_URL = dotenv.env[AppEnvKeys.BASE_URL];

  //AUTH
  static const loginAPI = '/api/v1/client/auth-users/login';

  static const List<String> nonAuthenticatedPaths = [
    loginAPI,
  ];
}
