import 'package:flutter/material.dart';

class RadioButtonPaymentChoice extends StatelessWidget {
  final int grupValue;
  final ValueChanged<int?> onChanged;

  const RadioButtonPaymentChoice({Key? key, required this.grupValue, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          title: const Text(
            "Transfer Bank",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: 0,
          groupValue: grupValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text(
            "Cash On Delivery (COD)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: 1,
          groupValue: grupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}