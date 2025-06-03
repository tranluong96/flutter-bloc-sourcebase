import 'package:flutter/material.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.image,
  });

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: image,
        ),
      ],
    );
  }
}
