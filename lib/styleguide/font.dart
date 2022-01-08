import 'package:flutter/material.dart';

class FontSize {
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

class Font {
  static TextStyle notoSansRegular(double fontSize, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'NotoSansJP-Regular',
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle notoSansBold(double fontSize, {Color? color}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'NotoSansJP-Regular',
      fontWeight: FontWeight.bold,
    );
  }
}