import 'package:ecommerce_umkm/presentation/customer/screens/home_screen/components/category_selector.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_screen/components/custom_app_bar.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_screen/components/poster_section.dart';
import 'package:ecommerce_umkm/presentation/widget/product_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterSection(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Produk",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                //CategorySelector(),
                SizedBox(height: 10),
                ProductGridView(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}