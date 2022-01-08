import 'package:flutter/material.dart';
import 'package:wanlog/components/label_and_checkbox.dart';
import 'package:wanlog/shared_models/notification_date.dart';
import 'package:wanlog/shared_models/time_unit.dart';
import 'package:wanlog/styleguide/colors.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class NotificationSelectSheet extends StatefulWidget {
  final ValueChanged<List<DateTime>> selectDate;
  final DateTime timestamp;

  const NotificationSelectSheet({
    Key? key,
    required this.selectDate,
    required this.timestamp,
  }) : super(key: key);

  @override
  _NotificationSelectSheetState createState() => _NotificationSelectSheetState();
}

class _NotificationSelectSheetState extends State<NotificationSelectSheet> {
  final List<NotificationDate> _selectDate = [];
  late final List<NotificationDate> _candidates = [
    NotificationDate(1, TimeUnit.minutes, widget.timestamp),
    NotificationDate(10, TimeUnit.hour, widget.timestamp),
    NotificationDate(20, TimeUnit.hour, widget.timestamp),
    NotificationDate(10, TimeUnit.minutes, widget.timestamp),
  ];

  List<Widget> get _candidateItems {
    List<Widget> _items = [];
    for (var candidate in _candidates) {
      _items.add(
        LabelAndCheckbox(title: candidate.string, check: (isCheck) {
          isCheck
              ? _selectDate.add(candidate)
              : _selectDate.remove(candidate);
          setState(() {
            _selectDate.sort((before, after) => after.compareTo(before));
          });
        })
      );
    }
    return _items;
  }

  List<Widget> get _selectedDateView {
    if (_selectDate.isEmpty) {
      return [Text(
        "通知は登録されていません",
        style: Font.notoSansBold(FontSize.small, color: WanlogColor.labelSecondary),
      )];
    } else {
      return _selectDate.map((e) =>
          Text(
            e.string,
            style: Font.notoSansBold(FontSize.small, color: WanlogColor.labelSecondary),
          )
      ).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: Spacing.small,
            children: _selectedDateView,
          ),
          const SizedBox(height: Spacing.large,),
          Expanded(
            child: Column(
              children: _candidateItems,
            ),
          ),
        ],
      ),
    );
  }
}
