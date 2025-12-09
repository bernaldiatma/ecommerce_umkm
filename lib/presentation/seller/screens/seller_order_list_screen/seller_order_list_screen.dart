import 'package:ecommerce_umkm/core/order_provider.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/home_seller.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_order_list_screen/components/seller_order_card.dart';
import 'package:ecommerce_umkm/core/seller_order_provider.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerOrderListScreen extends StatelessWidget {
  const SellerOrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: HomeSeller(),
      appBar: AppBar(
        title: Text(
          "Daftar Pesanan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Consumer<OrderProvider>(
          builder: (context, provider, child) {
            if (provider.orders.isEmpty) {
              return Center(
                child: Text(
                  "Tidak ada pesanan",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: provider.orders.length,
                itemBuilder: (context, index) {
                  final order = provider.orders[index];
                  return SellerOrderCard(order: order);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}