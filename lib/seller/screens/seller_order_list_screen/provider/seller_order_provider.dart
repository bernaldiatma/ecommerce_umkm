import 'package:ecommerce_umkm/seller/models/seller_order.dart';
import 'package:ecommerce_umkm/seller/models/seller_product.dart';
import 'package:flutter/material.dart';

class SellerOrderProvider extends ChangeNotifier{
  final List<SellerOrder> _sellerOrder = [
    SellerOrder(
        id: '${DateTime.now().toIso8601String()}',
        sellerProducts: [SellerProductList[0]],
        quantity: 3,
        totalAmount: 300000,
        orderDate: DateTime.now(),
        status: "Dikemas",
        paymentStatus: "Sudah Dibayar",
        paymentMethod: "Transfer Bank",
        expeditionCourier: "JNE",
    ),
    SellerOrder(
        id: '${DateTime.now().toIso8601String()}',
        sellerProducts: [SellerProductList[1]],
        quantity: 1,
        totalAmount: 100000,
        orderDate: DateTime.now(),
        status: "Dikemas",
        paymentStatus: "Sudah Dibayar",
        paymentMethod: "Transfer Bank",
        expeditionCourier: "Si Cepat",
    ),
  ];

  List<SellerOrder> get sellerOrder => _sellerOrder;

  void updateOrderStatus(String orderId, String newStatus) {
    try {
      final order = _sellerOrder.firstWhere((order) => order.id == orderId);

      order.status = newStatus;

      notifyListeners();
    } catch (e) {
      print("Error updating status: $e");
    }
  }
}