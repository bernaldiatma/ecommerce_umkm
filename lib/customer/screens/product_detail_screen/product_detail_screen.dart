import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/customer_utility/currency_format.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,       
          children: [
            Image.asset(
              product.imageProduct,
              height: 332,
              width: double.infinity, 
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(product.offerPrice != 0 ? product.offerPrice : product.price, 2),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: product.offerPrice != 0? Colors.deepPurple : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Visibility(
                    visible: product.offerPrice != 0,
                    child: Text(
                      CurrencyFormat.convertToIdr(product.price, 2),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
