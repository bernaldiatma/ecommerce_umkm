import 'package:ecommerce_umkm/models/cart.dart';
import 'package:ecommerce_umkm/models/order.dart';
import 'package:ecommerce_umkm/models/order_detail.dart';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final ApiServices api;
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  OrderProvider({required this.api}) {
    _initState();
  }

  void _initState() async {}

  void addOrder(
    List<Cart> cartProducts,
    double total,
    String paymentMethod,
    String expeditionCourier,
  ) async {
    var oneCart = cartProducts[0];
    var storeId = oneCart.product.storeId;
    var userId = oneCart.user.id;
    var qty = oneCart.qty;
    var price = oneCart.product.price;
    var orderId = await api.order.addOrder(storeId, userId, qty, price, total, paymentMethod);
    List<OrderDetail> od = [];
    for (var cart in cartProducts) {
      od.add(OrderDetail(id: '', order: cart.product.storeId, product: cart.product, qty: qty));
    }
    var orderDetail = await api.order.addOrderDetail(storeId, od);
    notifyListeners();
  }

  void updateOrderStatus(String orderId, String selectedStatus) async {

  }
}
