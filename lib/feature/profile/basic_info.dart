import 'package:flutter/material.dart';
import 'package:wanlog/components/date_picker.dart';
import 'package:wanlog/feature/profile/biological_sex_radio.dart';
import 'package:wanlog/feature/profile/profile_text_field.dart';
import 'package:wanlog/styleguide/buttons.dart';
import 'package:wanlog/styleguide/colors.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: Spacing.small),
          width: double.infinity,
          child: Text(
            "基本情報",
            style: Font.notoSansBold(FontSize.medium, color: WanlogColor.labelSecondary),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: Spacing.small),
        Container(
          decoration: BoxDecoration(
            color: WanlogColor.backgroundPrimary,
            border: Border.all(color: WanlogColor.backgroundPrimary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
            child: Column(
              children: [
                ProfileTextField(placeholder: "名前", onChange: (text) {
                }),
                const Divider(),

                Row(
                  children: [
                    const Icon(Icons.cake),
                    const SizedBox(width: Spacing.medium,),
                    Flexible(
                      child: DatePicker(onChange: (birthDate) {
                      }),
                    )
                  ],
                ),

                const Divider(),

                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16))
                        ),
                        builder: (context) => const SingleChildScrollView(
                          child: BiologicalSexRadio(),
                        )
                    );
                  },
                  icon: const Icon(Icons.transgender),
                  label: Text("通知なし"),
                  style: TextButtonStyle.primary,
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}
