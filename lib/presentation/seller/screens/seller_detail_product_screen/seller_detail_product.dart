import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_description.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_name.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_price.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_stock.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';

class SellerDetailProduct extends StatelessWidget {
  final Product product;

  const SellerDetailProduct({Key? key, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '$BASE_URL${product.productPhotoPath}',
              height: 332,
              width: double.infinity,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Edit Gambar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            EditProductName(product: product),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            EditProductPrice(product: product),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            EditProductStock(product: product),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            EditProductDescriprion(product: product),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
