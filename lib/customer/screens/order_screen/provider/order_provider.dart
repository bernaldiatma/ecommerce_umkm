import 'package:ecommerce_umkm/customer/models/order.dart';
import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(List<Product> cartProducts, double total, String paymentMethod, String expeditionCourier) {
    final DateTime orderTime = DateTime.now();

    for (var product in cartProducts) {
      final newOrder = Order(
        id: '${orderTime.toIso8601String()}',
        products: [product],
        totalAmount: product.price * product.quantity,
        orderDate: orderTime,
        status: "Diproses",
        paymentMethod: paymentMethod,
        expeditionCourier: expeditionCourier,
      );
      _orders.insert(0, newOrder);
    }
    notifyListeners();
  }
}