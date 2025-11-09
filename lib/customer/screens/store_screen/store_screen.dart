import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/models/product_provider.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/widget/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  final String storeName;

  const StoreScreen({Key? key, required this.storeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );

    final List<Product> storeProduct = productProvider.allProducts
        .where((product) => product.storeName == storeName)
        .toList();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 0.2),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(Icons.store_rounded, size: 26),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.check_box, size: 20, color: Colors.purpleAccent),
                  SizedBox(width: 6),
                  Text(
                    storeName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10,
              ),
              child: Text(
                "Produk",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            ProductGridView(items: storeProduct),
          ],
        ),
      ),
    );
  }
}
