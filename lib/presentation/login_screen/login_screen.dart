import 'dart:async';
import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_customer.dart';
import 'package:ecommerce_umkm/presentation/login_screen/components/email_field.dart';
import 'package:ecommerce_umkm/presentation/login_screen/components/login_button.dart';
import 'package:ecommerce_umkm/presentation/login_screen/components/password_field.dart';
import 'package:ecommerce_umkm/presentation/login_screen/components/sign_up_button.dart';
import 'package:ecommerce_umkm/models/user.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/home_seller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  bool isPasswordOrEmailFalse = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent.shade100, Colors.grey.shade200, Colors.grey.shade200],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                "Silahkan log in untuk melanjutkan",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey),
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
                      duration: Duration(milliseconds: 300),
                      child: Consumer<UserProvider>(
                        builder: (_, user, _) {
                          if (user.correctCredentials) {
                            return Text(
                              "Email atau password salah",
                              key: ValueKey('error_text'),
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return SizedBox.shrink(key: ValueKey('empty'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              LoginButton(
                login: () async {
                  final auth = Provider.of<UserProvider>(context, listen: false);
                  if (await auth.login(email, password)) {
                    var role = auth.user!.role;
                    late MaterialPageRoute route;
                    if (role == 'penjual') {
                      route = MaterialPageRoute(builder: (_) => HomeSeller());
                    } else {
                      route = MaterialPageRoute(builder: (_) => HomeCustomer());
                    }
                    Navigator.pushReplacement(context, route);
                  } else {
                    auth.toggleCorrectCredentials(true);
                    await Future.delayed(
                      Duration(seconds: 2),
                      () => auth.toggleCorrectCredentials(false),
                    );
                  }
                },
              ),
              SizedBox(height: 60),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
