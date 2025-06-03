import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';
import 'package:my_app/core/resources/res_text_styles.dart';
import 'package:my_app/routes/router.gr.dart' as router;

@RoutePage()
class DPPopup extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Widget> actions;
  final double _iconSize = 20;
  final bool isActiveIconClose;

  const DPPopup({
    super.key,
    this.title = '',
    required this.subTitle,
    this.actions = const [],
    this.isActiveIconClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        color: ResColors().textMain.withOpacity(0.9),
        child: AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          insetPadding: const EdgeInsets.all(46),
          iconPadding: const EdgeInsets.only(top: 12, left: 16, right: 16),
          titlePadding: const EdgeInsets.only(left: 12, right: 12),
          contentPadding: const EdgeInsets.all(12),
          actionsPadding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          icon: isActiveIconClose
              ? Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: _iconSize,
                      color: const Color.fromRGBO(153, 153, 153, 1),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          title: title.isEmpty
              ? null
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ResTextStyles()
                      .regular16
                      .copyWith(color: ResColors().textMain),
                ),
          content: Text(
            subTitle,
            textAlign: TextAlign.center,
            style:
                ResTextStyles().regular14.copyWith(color: ResColors().textMain),
          ),
          actions: actions.isEmpty ? null : [Row(children: actions)],
        ),
      ),
    );
  }
}

Future<T?> showDialogHelper<T extends Object?>(
  BuildContext context, {
  String? title = '',
  required String subTitle,
  bool isActiveIconClose = false,
  List<Widget> actions = const [],
}) {
  return context.router.push(
    router.DPPopup(
      title: title ?? '',
      subTitle: subTitle,
      actions: actions,
      isActiveIconClose: isActiveIconClose,
    ),
  );
}

Future<T?> showDialogHelperByRouter<T extends Object?>(
  StackRouter appRouter, {
  String? title = '',
  required String subTitle,
  bool isActiveIconClose = false,
  List<Widget> actions = const [],
}) {
  return appRouter.push(
    router.DPPopup(
      title: title ?? '',
      subTitle: subTitle,
      actions: actions,
      isActiveIconClose: isActiveIconClose,
    ),
  );
}
