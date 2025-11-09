import 'package:ecommerce_umkm/customer/screens/bottom_nav_bar.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/provider/cart_provider.dart';
import 'package:ecommerce_umkm/customer/screens/order_screen/provider/order_provider.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CodSuccessScreen extends StatefulWidget {
  final String paymentMethod;
  final String expedition;
  const CodSuccessScreen({Key? key, required this.paymentMethod, required this.expedition}) : super(key: key);

  @override
  State<CodSuccessScreen> createState() => _CodSuccessScreenState();
}

class _CodSuccessScreenState extends State<CodSuccessScreen> {

  void _processOrder() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    if (cartProvider.cart.isNotEmpty) {
      orderProvider.addOrder(
        cartProvider.cart,
        cartProvider.getTotalPrice(),
        widget.paymentMethod,
        widget.expedition,
      );

      cartProvider.clearCart();
    }
  }

  @override
  void initState() {
    super.initState();
    _processOrder();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Transaksi Berhasil",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 70),
          ),
          SizedBox(height: 100),
          Container(
            width: 240,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavBar()),
                );
              },
              child: Text(
                "Kembali",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}