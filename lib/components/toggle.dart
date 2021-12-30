import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const Toggle({
    Key? key,
    this.isOn = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  late bool _isOn = widget.isOn;

  @override
  Widget build(BuildContext context) {
    return Switch(value: _isOn, onChanged: (value) {
      setState(() => _isOn = value);
      widget.onChanged(value);
    });
  }
}
