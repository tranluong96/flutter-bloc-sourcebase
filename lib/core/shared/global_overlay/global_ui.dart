import 'package:my_app/core/shared/global_overlay/overlay_controller.dart';
import 'package:my_app/core/shared/global_overlay/toast_type.dart';

/// Facade tiện dụng để gọi loading/toast toàn cục từ bất kỳ đâu
/// (page, bloc, interceptor) mà không cần BuildContext.
///
/// ```dart
/// GlobalUi.showLoading();
/// GlobalUi.hideLoading();
/// GlobalUi.showSuccess('Đã lưu');
/// GlobalUi.showError('Có lỗi xảy ra');
/// ```
class GlobalUi {
  GlobalUi._();

  static OverlayController get _c => OverlayController.instance;

  // Loading
  static void showLoading() => _c.showLoading();
  static void hideLoading() => _c.hideLoading();
  static void resetLoading() => _c.resetLoading();

  // Toast
  static void showToast(
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) =>
      _c.showToast(message, type: type, duration: duration);

  static void showInfo(String message) =>
      _c.showToast(message, type: ToastType.info);
  static void showSuccess(String message) =>
      _c.showToast(message, type: ToastType.success);
  static void showWarning(String message) =>
      _c.showToast(message, type: ToastType.warning);
  static void showError(String message) =>
      _c.showToast(message, type: ToastType.error);

  static void dismissToast() => _c.dismissToast();
}
