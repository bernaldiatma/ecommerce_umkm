import 'package:ecommerce_umkm/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final double totalAmount;
  final DateTime orderDate;
  String status;
  final String paymentMethod;
  final String expeditionCourier;

  Order({
    required this.id,
    required this.products,
    required this.totalAmount,
    required this.orderDate,
    this.status = "Diproses",
    required this.paymentMethod,
    required this.expeditionCourier,
  });
}
