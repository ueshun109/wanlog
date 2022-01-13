import 'package:flutter/material.dart';
import 'package:wanlog/helper/date.dart';
import 'package:wanlog/styleguide/buttons.dart';
import 'package:wanlog/styleguide/font.dart';

class DatePicker extends StatefulWidget {
  final DateTime? dateTime;
  final ValueChanged<DateTime> onChange;

  const DatePicker({
    Key? key,
    this.dateTime,
    required this.onChange,
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _date = widget.dateTime ?? DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButtonStyle.primary,
      onPressed: () async {
        DateTime? date = await _selectDate(context);
        setState(() => _date = date ?? DateTime.now());
        widget.onChange(DateTime(_date.year, _date.month, _date.day));
      },
      child: Text(_date.japanese, style: Font.notoSansRegular(FontSize.medium)),
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
}
