import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';

/// Loại toast/banner hiển thị ở top màn hình.
enum ToastType { info, success, warning, error }

extension ToastTypeStyle on ToastType {
  Color get background {
    switch (this) {
      case ToastType.info:
        return ResColors().link;
      case ToastType.success:
        return const Color(0xff52C41A);
      case ToastType.warning:
        return const Color(0xffFAAD14);
      case ToastType.error:
        return ResColors().error;
    }
  }

  IconData get icon {
    switch (this) {
      case ToastType.info:
        return Icons.info_outline;
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.warning:
        return Icons.warning_amber_rounded;
      case ToastType.error:
        return Icons.error_outline;
    }
  }
}

/// Dữ liệu 1 toast đang hiển thị. [id] để [AnimatedSwitcher] phân biệt các toast
/// liên tiếp và chạy animation vào/ra.
class ToastData {
  final int id;
  final String message;
  final ToastType type;

  const ToastData({
    required this.id,
    required this.message,
    required this.type,
  });
}
