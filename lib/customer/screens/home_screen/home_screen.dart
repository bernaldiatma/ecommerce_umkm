import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/home_screen/components/category_selector.dart';
import 'package:ecommerce_umkm/customer/screens/home_screen/components/custom_app_bar.dart';
import 'package:ecommerce_umkm/customer/screens/home_screen/components/poster_section.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/widget/product_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PosterSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Kategori",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              const CategorySelector(),
              SizedBox(height: 8),
              ProductGridView(items: ProductList),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}