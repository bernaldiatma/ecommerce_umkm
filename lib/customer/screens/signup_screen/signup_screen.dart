import 'package:ecommerce_umkm/customer/screens/signup_screen/components/email_field.dart';
import 'package:ecommerce_umkm/customer/screens/signup_screen/components/password_field.dart';
import 'package:ecommerce_umkm/customer/screens/signup_screen/components/signup_button.dart';
import 'package:ecommerce_umkm/customer/screens/signup_screen/components/username_field.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Buat akun untuk melanjutkan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            const UsernameField(),
            SizedBox(height: 18),
            const EmailField(),
            SizedBox(height: 18),
            const PasswordField(),
            SizedBox(height: 60),
            const SignupButton(),
          ],
        ),
      ),
    );
  }
}