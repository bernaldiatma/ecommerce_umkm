import 'package:ecommerce_umkm/customer/screens/cart_screen/provider/cart_provider.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/bank_payment_success.dart';
import 'package:ecommerce_umkm/customer/screens/order_screen/provider/order_provider.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class BankTransferScreen extends StatefulWidget {
  final String paymentMethod;
  final String expedition;
  const BankTransferScreen ({Key? key, required this.paymentMethod, required this.expedition}) : super(key: key);

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informasi Rekening",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Bank              :   Bank Rakyat Hitam",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "No Rekening :   957297529745293752",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 220,
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
                              MaterialPageRoute(builder: (_) => BankPaymentSuccess())
                            );
                          },
                          child: Text(
                            "Selesaikan Pembayaran",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}