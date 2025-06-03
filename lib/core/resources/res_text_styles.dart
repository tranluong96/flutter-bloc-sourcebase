import 'package:flutter/material.dart';

class ResTextStyles {
  const ResTextStyles._();

  static const ResTextStyles _instance = ResTextStyles._();

  factory ResTextStyles() {
    return _instance;
  }

  static const Color _textColor = Color(0xff262626);

  //MEDIUM
  TextStyle get medium16 {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: _textColor,
      height: 1.5,
    );
  }

  //REGULAR
  TextStyle get regular16 { 
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: _textColor,
    );
  }

  TextStyle get regular14 { 
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: _textColor,
    );
  }
}
