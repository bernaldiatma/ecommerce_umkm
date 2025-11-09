import 'package:flutter/material.dart';

class RadioButtonExpeditionChoice extends StatelessWidget {

  final int groupValue;
  final ValueChanged<int?> onChanged;

  const RadioButtonExpeditionChoice({
    Key? key,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        RadioListTile<int>(
          title: const Text(
            "JNE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          value: 0,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text(
            "JNT",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          value: 1,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text(
            "Si Cepat",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          value: 2,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}