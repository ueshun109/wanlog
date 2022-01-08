import 'package:flutter/material.dart';
import 'package:wanlog/styleguide/colors.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class LabelAndCheckbox extends StatefulWidget {
  final String title;
  final ValueChanged<bool> check;

  const LabelAndCheckbox({
    Key? key,
    required this.title,
    required this.check,
  }) : super(key: key);

  @override
  _LabelAndCheckboxState createState() => _LabelAndCheckboxState();
}

class _LabelAndCheckboxState extends State<LabelAndCheckbox> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: InkWell(
          onTap: () {
            setState(() => _isCheck = !_isCheck);
            widget.check(_isCheck);
          },
          child: Container(
            color: _isCheck ? WanlogColor.primary20 : Theme.of(context).bottomSheetTheme.backgroundColor,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Spacing.medium),
                  child: Text(
                    widget.title,
                    style: Font.notoSansBold(
                        FontSize.medium,
                        color: _isCheck ? WanlogColor.primary : WanlogColor.labelSecondary
                    ),
                  ),
                ),
                const Spacer(),
                Checkbox(
                  activeColor: WanlogColor.primary,
                  value: _isCheck,
                  onChanged: (value) {
                    setState(() => _isCheck = value!);
                    widget.check(value!);
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
