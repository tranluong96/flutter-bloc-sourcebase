import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/generated/assets.gen.dart';

class RowOptionWidget extends StatelessWidget {
  const RowOptionWidget({super.key, required this.title, required this.icon, required this.onTap});

  final String title;
  final Widget icon;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  color: ResColors().primary,
                  child: Center(
                    child: icon,
                  ),
                ),
              ),
              16.widthBox,
              Text(title, style: ResTextStyles().medium16),
            ],
          ),
          Assets.icons.icArrowRight.image(width: 24, height: 24),
        ],
      ).paddingAll(12),
    );
  }
}
