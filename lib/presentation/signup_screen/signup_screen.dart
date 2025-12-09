import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/presentation/login_screen/login_screen.dart';
import 'package:ecommerce_umkm/presentation/signup_screen/components/email_field.dart';
import 'package:ecommerce_umkm/presentation/signup_screen/components/log_in_button.dart';
import 'package:ecommerce_umkm/presentation/signup_screen/components/password_field.dart';
import 'package:ecommerce_umkm/presentation/signup_screen/components/signup_button.dart';
import 'package:ecommerce_umkm/presentation/signup_screen/components/username_field.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  String username = "";
  String email = "";
  String password = "";

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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftar",
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
              UsernameField(
                onUsernameChanged: (username) {
                this.username = username;
              },),
              SizedBox(height: 18),
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
              SizedBox(height: 60),
              SignupButton(
                SignUp: () async {
                  final auth = context.watch<UserProvider>();
                  bool response = await auth.register(
                      this.username,
                      this.email,
                      this.password
                  );
                  if (response) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                    //TODO tampilkan snackbar registrasi berhasil/pendaftaran berhasi
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                            content: Center(
                              child: Text(
                                  'Registrasi Berhasil',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        ),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(
                          'Semua data wajib diisi',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 60),
              const LogInButton(),
            ],
          ),
        ),
      ),
    );
  }
}