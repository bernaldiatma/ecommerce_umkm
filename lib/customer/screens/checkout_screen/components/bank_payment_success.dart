import 'package:ecommerce_umkm/customer/screens/bottom_nav_bar.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class BankPaymentSuccess extends StatelessWidget {
  const BankPaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Transaksi Berhasil",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 70),
          ),
          SizedBox(height: 100),
          Container(
            width: 240,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavBar()),
                );
              },
              child: Text(
                "Kembali",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}