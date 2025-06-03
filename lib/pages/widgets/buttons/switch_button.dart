import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  const SwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: ResColors().white,
          activeTrackColor: ResColors().link,
          inactiveThumbColor: ResColors().white,
          inactiveTrackColor: ResColors().link,
          trackOutlineColor: WidgetStateProperty.all(ResColors().link),
        ),
      ],
    );
  }
}
