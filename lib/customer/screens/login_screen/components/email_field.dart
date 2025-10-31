import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function(String email) onEmailChanged;
  const EmailField({Key? key, required this.onEmailChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        hintText: "Masukkan email",
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(Icons.mail_outline, color: Colors.grey),
      ),
      onChanged: onEmailChanged,
    );
  }
}
