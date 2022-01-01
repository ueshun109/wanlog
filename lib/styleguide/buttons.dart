import 'package:flutter/material.dart';
import 'package:wanlog/styleguide/space.dart';

class TextButtonStyle {
  static ButtonStyle primary =
  TextButton.styleFrom(
    primary: Colors.black87,
    padding: const EdgeInsets.symmetric(vertical: Spacing.xSmall),
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
