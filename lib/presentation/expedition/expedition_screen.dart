import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class ExpeditionScreen extends StatelessWidget {
  const ExpeditionScreen (Key? key) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("List Product", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}