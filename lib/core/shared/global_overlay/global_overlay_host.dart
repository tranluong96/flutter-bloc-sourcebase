import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';
import 'package:my_app/core/resources/res_text_styles.dart';
import 'package:my_app/core/shared/global_overlay/overlay_controller.dart';
import 'package:my_app/core/shared/global_overlay/toast_type.dart';
import 'package:my_app/core/shared/loading_widget.dart';

/// Bọc toàn bộ nội dung app (đặt tại `MaterialApp.router`'s `builder`) để
/// hiển thị loading + toast toàn cục nằm trên mọi màn hình.
class GlobalOverlayHost extends StatelessWidget {
  final Widget child;

  const GlobalOverlayHost({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = OverlayController.instance;
    return Stack(
      children: [
        child,
        // ----- Loading -----
        ValueListenableBuilder<int>(
          valueListenable: controller.loadingCount,
          builder: (context, count, _) {
            if (count <= 0) return const SizedBox.shrink();
            return const Positioned.fill(child: _LoadingLayer());
          },
        ),
        // ----- Toast banner (top) -----
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: ValueListenableBuilder<ToastData?>(
              valueListenable: controller.toast,
              builder: (context, data, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                  child: data == null
                      ? const SizedBox(width: double.infinity)
                      : _ToastBanner(
                          key: ValueKey<int>(data.id),
                          data: data,
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingLayer extends StatelessWidget {
  const _LoadingLayer();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ModalBarrier(dismissible: false, color: Colors.black26),
        Center(child: LoadingWidget()),
      ],
    );
  }
}

class _ToastBanner extends StatelessWidget {
  final ToastData data;

  const _ToastBanner({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => OverlayController.instance.dismissToast(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: data.type.background,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(data.type.icon, color: ResColors().white, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data.message,
                    style: ResTextStyles().regular14.copyWith(
                          color: ResColors().white,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
