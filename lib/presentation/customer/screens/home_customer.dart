import 'package:ecommerce_umkm/presentation/customer/screens/home_screen/home_screen.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/order_screen/order_screen.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_favorite_screen/product_favorite_screen.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/profile_screen/profile_screen.dart';
import 'package:ecommerce_umkm/presentation/widget/google_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({Key? key,}) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  int _selectIndex = 0;
  late final List<Widget> _screens = [
    HomeScreen(),
    ProductFavoriteScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectIndex],
      bottomNavigationBar: GoogleNavBar(
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}