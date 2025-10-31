import 'dart:async';
import 'package:ecommerce_umkm/core/data_provider.dart';
import 'package:ecommerce_umkm/customer/screens/bottom_nav_bar.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/email_field.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/login_button.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/password_field.dart';
import 'package:ecommerce_umkm/customer/screens/login_screen/components/sign_up_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DataProvider provider = DataProvider();
  String email = "";
  String password = "";

  bool isPasswordOrEmailFalse = false;
  Timer? _textTimer;

  @override
  void dispose() {
    _textTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purpleAccent.shade100,
            Colors.grey.shade200,
            Colors.grey.shade200,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              EmailField(
                onEmailChanged: (email) {
                  this.email = email;
                },
              ),
              SizedBox(height: 18),
              PasswordField(
                onPasswordChanged: (password) {
                  this.password = password;
                },
              ),
              SizedBox(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child:
                        isPasswordOrEmailFalse == true ?
                        Text(
                          "Email atau password salah",
                          key: const ValueKey('error_text'),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ) : SizedBox.shrink(
                          key: const ValueKey('empty'),
                        ),
                    ),
                  ],
                ),
              ),
              LoginButton(
                login: () async {
                  _textTimer?.cancel();
                  Map<String, dynamic> response = await provider.service.login(
                    this.email,
                    this.password,
                  );
                  if (response['status']) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => BottomNavBar()),
                    );
                  } else {
                    setState(() {
                      isPasswordOrEmailFalse = true;
                    });
                    _textTimer = Timer(const Duration(seconds: 2), () {
                      setState(() {
                        isPasswordOrEmailFalse = false;
                      });
                    });
                  }
                },
              ),
              SizedBox(height: 60),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
