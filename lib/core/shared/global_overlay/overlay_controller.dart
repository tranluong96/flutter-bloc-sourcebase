import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:my_app/core/shared/global_overlay/toast_type.dart';

/// Điều phối UI toàn cục (loading + toast). Là singleton để dùng được ở nơi
/// không có BuildContext (vd Dio interceptor). Widget [GlobalOverlayHost] lắng
/// nghe các [ValueListenable] này để render.
class OverlayController {
  OverlayController._();
  static final OverlayController instance = OverlayController._();

  /// Đếm số request đang loading để hỗ trợ nhiều call đồng thời.
  /// > 0 nghĩa là đang hiển thị loading.
  final ValueNotifier<int> loadingCount = ValueNotifier<int>(0);

  /// Toast hiện tại (null = không hiển thị).
  final ValueNotifier<ToastData?> toast = ValueNotifier<ToastData?>(null);

  int _toastSeq = 0;
  Timer? _toastTimer;

  // ----- Loading -----
  void showLoading() => loadingCount.value++;

  void hideLoading() {
    if (loadingCount.value > 0) loadingCount.value--;
  }

  /// Ép tắt loading bất kể counter (dùng khi cần reset, vd logout).
  void resetLoading() => loadingCount.value = 0;

  // ----- Toast -----
  void showToast(
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    _toastTimer?.cancel();
    toast.value = ToastData(id: ++_toastSeq, message: message, type: type);
    _toastTimer = Timer(duration, dismissToast);
  }

  void dismissToast() {
    _toastTimer?.cancel();
    _toastTimer = null;
    toast.value = null;
  }
}
