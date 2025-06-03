import 'package:dio/dio.dart';
import 'package:my_app/core/utils/session/session.dart';
import 'package:my_app/core/utils/network/app_endpoints.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor(this._session);

  final Session _session;

  /// Whether request requires authentication or not.
  bool isAuthenticatedPath(RequestOptions options) =>
      !APPEndpoints.nonAuthenticatedPaths.contains(options.path);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (isAuthenticatedPath(options) && _session.accessToken.isNotEmpty) {
      final String accessToken = _session.accessToken;
      options.headers['Authorization'] = 'Bearer $accessToken';
      options.receiveTimeout = const Duration(milliseconds: 60000);
      options.connectTimeout = const Duration(milliseconds: 60000);
    }

    handler.next(options);
  }
}
