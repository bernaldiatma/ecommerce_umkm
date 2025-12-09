import 'package:flutter/material.dart';

class RadioButtonStatusChoice extends StatelessWidget {
  final int grupValue;
  final ValueChanged<int?> onChanged;

  const RadioButtonStatusChoice({Key? key, required this.grupValue, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          title: const Text(
            "Diterima Kurir",
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
            "Dikirim Ke Kota Tujuan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: 1,
          groupValue: grupValue,
          onChanged: onChanged,
        ),RadioListTile<int>(
          title: const Text(
            "Diterima Di Kota Tujuan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: 2,
          groupValue: grupValue,
          onChanged: onChanged,
        ),RadioListTile<int>(
          title: const Text(
            "Diterima Oleh Yang Bersangkutan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: 3,
          groupValue: grupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}