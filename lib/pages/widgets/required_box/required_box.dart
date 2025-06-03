import 'package:flutter/widgets.dart';
import 'package:my_app/core/resources/res.dart';

class RequiredField extends StatelessWidget {
  final String title;
  final bool isRequired;
  final Widget child;

  const RequiredField({
    super.key,
    required this.title,
    required this.child,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: ResTextStyles()
                  .medium16
                  .copyWith(color: ResColors().textMain),
            ),
            Visibility(
              visible: isRequired,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Text(
                    "必須",
                    style: ResTextStyles()
                        .regular14
                        .copyWith(color: ResColors().error),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
