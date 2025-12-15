import 'package:ecommerce_umkm/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const Icon (
              Icons.shopping_bag,
              color: Colors.deepPurple,
              size: 160,
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "Umagan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}