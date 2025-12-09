import 'package:ecommerce_umkm/presentation/customer/screens/home_customer.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() login;
  const LoginButton({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: login,
      child: Text(
        "Login",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}