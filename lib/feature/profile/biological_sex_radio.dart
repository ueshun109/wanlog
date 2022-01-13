import 'package:flutter/material.dart';
import 'package:wanlog/shared_models/biological_sex.dart';

class BiologicalSexRadio extends StatefulWidget {
  const BiologicalSexRadio({Key? key}) : super(key: key);

  @override
  _BiologicalSexRadioState createState() => _BiologicalSexRadioState();
}

class _BiologicalSexRadioState extends State<BiologicalSexRadio> {
  BiologicalSex? _biologicalSex = BiologicalSex.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: const Text("オス"),
            value: BiologicalSex.male,
            groupValue: _biologicalSex,
            onChanged: (BiologicalSex? sex) {
              setState(() => _biologicalSex = sex);
            }),
        RadioListTile(
            title: const Text("メス"),
            value: BiologicalSex.female,
            groupValue: _biologicalSex,
            onChanged: (BiologicalSex? sex) {
              setState(() => _biologicalSex = sex);
            })
      ],
    );
  }
}
