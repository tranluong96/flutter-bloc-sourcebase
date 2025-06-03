import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';
import 'package:my_app/core/resources/res_text_styles.dart';

import '../../shared/loading_widget.dart';

extension ModalExtension on BuildContext {
  // Show alert dialog loading
  Future<void> showAlertLoading() async {
    await showDialog<bool>(
      context: this,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: LoadingWidget(),
      ),
    );
  }

  // Hide loading
  Future<void> hideAlertLoading() async {
    Navigator.of(this, rootNavigator: true).pop();
  }

  // Show alert dialog
  Future<void> showAlertDialog({
    required String message,
    String? title,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
  }) async {
    await showDialog<bool>(
      context: this,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        iconPadding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        contentPadding: const EdgeInsets.all(16),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: title != null
            ? Text(
                title,
                style: ResTextStyles().medium16,
                textAlign: TextAlign.center,
              )
            : null,
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            message,
            style: ResTextStyles().regular16,
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: ResColors().primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "OK",
                    style: ResTextStyles().medium16.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Show confirm dialog
  Future<bool> showConfirmDialog({
    required String message,
    String? title,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    Color? confirmColor,
    Color? cancelColor,
  }) async {
    final result = await showDialog<bool>(
      context: this,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: title != null
            ? Text(
                title,
                style: ResTextStyles().medium16,
                textAlign: TextAlign.center,
              )
            : null,
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            message,
            style: ResTextStyles().regular16,
            textAlign: TextAlign.center,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: ResColors().placeholder,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    cancelText,
                    style: ResTextStyles().regular16.copyWith(
                          color: cancelColor ?? ResColors().textMain,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: ResColors().primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    confirmText,
                    style: ResTextStyles().medium16.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
        actionsPadding: const EdgeInsets.all(16),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      ),
    );
    return result ?? false;
  }

  // Show action sheet
  Future<T?> showActionBottomSheet<T>({
    required List<ActionSheetItem<T>> items,
    String? title,
    String? cancelText,
  }) async {
    final result = await showModalBottomSheet<T>(
      context: this,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.only(bottom: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Text(
                  title,
                  style: ResTextStyles().medium16.copyWith(
                        color: ResColors().textMain.withOpacity(0.6),
                      ),
                ),
              ),
            ...items.map((item) => InkWell(
                  onTap: () => Navigator.pop(context, item.value),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        if (item.icon != null) ...[
                          Icon(
                            item.icon,
                            size: 22,
                            color: item.isDestructive
                                ? ResColors().error
                                : ResColors().textMain,
                          ),
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: Text(
                            item.title,
                            style: ResTextStyles().regular16.copyWith(
                                  color: item.isDestructive
                                      ? ResColors().error
                                      : ResColors().textMain,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            if (cancelText != null) ...[
              const Divider(height: 8, thickness: 8),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    cancelText,
                    style: ResTextStyles().medium16.copyWith(
                          color: ResColors().primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
    return result;
  }
}

class ActionSheetItem<T> {
  final String title;
  final T value;
  final IconData? icon;
  final bool isDestructive;

  const ActionSheetItem({
    required this.title,
    required this.value,
    this.icon,
    this.isDestructive = false,
  });
}
