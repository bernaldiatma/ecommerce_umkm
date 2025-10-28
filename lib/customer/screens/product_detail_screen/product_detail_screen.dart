import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget{
  final Product product;

  const ProductDetailScreen({Key, key, required this.product}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}