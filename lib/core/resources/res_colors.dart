import 'package:flutter/material.dart';

class ResColors {
  const ResColors._privateConstructor();

  static const ResColors _instance = ResColors._privateConstructor();

  factory ResColors() {
    return _instance;
  }

  Color get textMain => const Color(0xff262626);
  Color get white => const Color(0xffffffff);
  Color get strokeAppbar => const Color(0xffE5E5E5);
  Color get stroke => const Color(0xff9CD1E1);
  Color get disabled => const Color(0xffE5E5E5);
  Color get error => const Color(0xffFF4D4F);
  Color get link => const Color(0xff3896FA);
  Color get primary => const Color(0xff006EE4);
  Color get secondary => const Color(0xff003D7E);
  Color get placeholder => const Color(0xffD1D1D1);
}
