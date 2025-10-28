import 'package:ecommerce_umkm/customer/screens/login_screen/components/email_field.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/login_button.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/password_field.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/sign_up_button.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Silahkan log in untuk melanjutkan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            const EmailField(),
            SizedBox(height: 18),
            const PasswordField(),
            SizedBox(height: 40),
            const LoginButton(),
            SizedBox(height: 60),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}