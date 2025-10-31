import 'package:ecommerce_umkm/customer/screens/home_screen/home_screen.dart';
import 'package:ecommerce_umkm/customer/screens/order_screen/order_screen.dart';
import 'package:ecommerce_umkm/customer/screens/product_favorite_screen/product_favorite_screen.dart';
import 'package:ecommerce_umkm/customer/screens/profile_screen/profile_screen.dart';
import 'package:ecommerce_umkm/widget/google_nav_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectIndex = 0;
  final List<Widget> _screens = [
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