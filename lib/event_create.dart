import 'package:flutter/material.dart';
import 'package:wanlog/components/date_time_picker.dart';
import 'package:wanlog/components/toggle.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  _EventCreatePageState createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  String _title = "";

  Widget _allDay() {
    return Row(
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: Spacing.medium,
          children: [
            const Icon(Icons.schedule),
            Text('終日', style: Font.notoSansRegular(FontSize.medium),),
          ],
        ),
        const Spacer(),
        Toggle(onChanged: (value) {

        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("登録"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "タイトル",
                ),
                style: Font.notoSansBold(FontSize.large),
                onChanged: (text) {
                  _title = text;
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
                child: Column(
                  children: [
                    _allDay(),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: Spacing.xLarge),
                          child: DateTimePicker(selectedDate: (DateTime dateTime) {

                          }),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: Spacing.xLarge),
                          child: DateTimePicker(selectedDate: (DateTime dateTime) {

                          }),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                    Container(
                      height: 200,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              )
            ))
          ],
        ),
      ),
    );
  }
}