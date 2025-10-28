import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
   const UsernameField({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     return TextField(
       decoration: InputDecoration(
         labelText: "Username",
         labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
         hintText: "Masukkan username",
         hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: primaryColor),
           borderRadius: BorderRadius.circular(8),
         ),
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: primaryColor),
           borderRadius: BorderRadius.circular(8),
         ),
         prefixIcon: Icon(Icons.person_outlined, color: Colors.grey),
       ),
     );
   }
}