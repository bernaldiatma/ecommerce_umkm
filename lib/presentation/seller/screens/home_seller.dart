import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/presentation/login_screen/login_screen.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/add_product_screen/add_product_screen.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_home_screen/seller_home_screen.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_order_list_screen/seller_order_list_screen.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_profile_screen/seller_profil_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSeller extends StatelessWidget {
  Future<bool?> showConfirmDialog(
    BuildContext context, {
    String title = 'Confirm',
    String message = 'Are you sure?',
    required Function onYes,
    required VoidCallback onNo,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must choose
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onNo.call();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onYes.call();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.storefront_outlined, size: 34)),
            accountName: Text(
              user.loading? '_____':user.user!.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(user.loading? '_____':user.user!.email,),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SellerHomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text("Daftar Pesanan", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SellerOrderListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Tambah Produk", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => AddProductScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.storefront_rounded),
            title: Text("Profil Toko", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SellerProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              showConfirmDialog(
                context,
                title: 'Konfirmasi',
                message: 'Anda ingin logout?',
                onNo: () {},
                onYes: () async {
                  final user = Provider.of<UserProvider>(context, listen: false);
                  await user.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
