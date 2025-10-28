import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        hintText: "Masukkan password",
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
        suffixIcon: Icon(Icons.visibility_off),
      ),
    );
  }
}
