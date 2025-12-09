import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ecommerce_umkm/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<ProductProvider>(
        builder: (_, prod, _) {
          return GridView.builder(
            itemCount: prod.listProduct.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var product = prod.listProduct[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: ProductCard(key, product),
              );
            },
          );
        },
      ),
    );
  }
}