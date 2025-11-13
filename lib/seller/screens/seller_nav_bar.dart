import 'package:ecommerce_umkm/seller/screens/add_product_screen/add_product_screen.dart';
import 'package:ecommerce_umkm/seller/screens/seller_home_screen/seller_home_screen.dart';
import 'package:ecommerce_umkm/seller/screens/seller_order_list_screen/seller_order_list_screen.dart';
import 'package:ecommerce_umkm/seller/screens/seller_profile_screen/seller_profil_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class SellerNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.storefront_outlined, size: 34),
            ),
            accountName: Text(
                "Vasvit Official Store",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            accountEmail: Text("vasvit@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Beranda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SellerHomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text(
              "Daftar Pesanan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SellerOrderListScreen())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              "Tambah Produk",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AddProductScreen())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.storefront_rounded),
            title: Text(
              "Profil Toko",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SellerProfileScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}
