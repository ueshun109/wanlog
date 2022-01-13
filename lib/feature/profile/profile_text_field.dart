import 'package:flutter/material.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class ProfileTextField extends StatelessWidget {
  final String placeholder;
  final ValueChanged<String> onChange;
  const ProfileTextField({
    Key? key,
    required this.placeholder,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.pets),
        const SizedBox(width: Spacing.medium,),
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
            ),
            style: Font.notoSansBold(FontSize.medium),
            onChanged: (text) {
              onChange(text);
            },
          ),
        )
      ],
    );
  }
}
