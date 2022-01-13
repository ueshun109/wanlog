import 'package:flutter/material.dart';
import 'package:wanlog/feature/profile/basic_info.dart';
import 'package:wanlog/shared_models/dog.dart';
import 'package:wanlog/styleguide/colors.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class ProfilePage extends StatefulWidget {
  final Dog? dog;
  const ProfilePage({Key? key, this.dog}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Dog? _dog = widget.dog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("プロフィール"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
          child: SingleChildScrollView(
            child: BasicInfo()
          ),
        ),
      )
    );
  }
}

abstract class ProfileListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class ProfileHeader implements ProfileListItem {
  final String heading;

  ProfileHeader(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
        heading,
      style: Font.notoSansBold(FontSize.medium),
    );
  }

  @override
  Widget buildSubTitle(BuildContext context) => const SizedBox.shrink();
}

