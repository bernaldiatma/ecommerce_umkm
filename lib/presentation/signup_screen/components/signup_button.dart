import 'package:ecommerce_umkm/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final Function() SignUp;
  const SignupButton({Key? key, required this.SignUp}) : super(key: key);

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
      onPressed: SignUp,
      child: Text(
        "Daftar",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}