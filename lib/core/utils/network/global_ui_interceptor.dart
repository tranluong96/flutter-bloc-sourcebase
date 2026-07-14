import 'package:dio/dio.dart';
import 'package:my_app/core/shared/global_overlay/global_ui.dart';
import 'package:my_app/core/utils/network/api_extra_keys.dart';

/// Kết nối tầng network với UI toàn cục:
/// - Bật/tắt loading toàn cục theo cờ [ApiExtraKeys.showLoading].
/// - Tự hiển thị toast lỗi khi request fail, trừ khi [ApiExtraKeys.skipError].
class GlobalUiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_flag(options.extra, ApiExtraKeys.showLoading)) {
      GlobalUi.showLoading();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_flag(response.requestOptions.extra, ApiExtraKeys.showLoading)) {
      GlobalUi.hideLoading();
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final extra = err.requestOptions.extra;
    if (_flag(extra, ApiExtraKeys.showLoading)) {
      GlobalUi.hideLoading();
    }
    if (err.type == DioExceptionType.cancel) {
      handler.next(err);
      return;
    }
    if (!_flag(extra, ApiExtraKeys.skipError)) {
      GlobalUi.showError(_resolveMessage(err));
    }
    handler.next(err);
  }

  bool _flag(Map<String, dynamic> extra, String key) => extra[key] == true;

  String _resolveMessage(DioException err) {
    final statusCode = err.response?.statusCode ?? 0;

    if (statusCode >= 500) return 'Server is not working';
    if (statusCode == 401) return 'Session expired. Please login again.';

    const networkTypes = {
      DioExceptionType.unknown,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.connectionTimeout,
      DioExceptionType.connectionError,
    };
    if (networkTypes.contains(err.type)) return 'Network error';

    final data = err.response?.data;
    if (data is Map) {
      final message = data['message'];
      if (message is List && message.isNotEmpty) return message.first.toString();
      if (message != null) return message.toString();
    }
    return 'Something went wrong';
  }
}
