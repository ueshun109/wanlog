import 'package:flutter/material.dart';
import 'package:wanlog/helper/date.dart';
import 'package:wanlog/styleguide/font.dart';
import 'package:wanlog/styleguide/space.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime? dateTime;
  final ValueChanged<DateTime> selectedDate;

  const DateTimePicker({
    Key? key,
    this.dateTime,
    required this.selectedDate,
  }) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime _date = widget.dateTime ?? DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: Spacing.xSmall),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () async {
              DateTime? date = await _selectDate(context);
              setState(() => _date = date ?? DateTime.now());
              widget.selectedDate(DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute));
            },
            child: Text(_date.japanese, style: Font.notoSansRegular(FontSize.medium)),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: Spacing.xSmall),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () async {
              TimeOfDay? time = await _selectTime(context);
              setState(() => _time = time ?? TimeOfDay.now());
              widget.selectedDate(DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute));
              },
            child: Text(_time.format(context), style: Font.notoSansRegular(FontSize.medium)),
          )
        ],
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100)
    );
    return pickedDate;
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _time
    );
    return pickedTime;
  }
}
