import 'package:ecommerce_umkm/presentation/seller/models-sel/seller_product.dart';

class SellerOrder {
  final String id;
  final List<SellerProduct> sellerProducts;
  final double quantity;
  final double totalAmount;
  final DateTime orderDate;
  String status;
  String paymentStatus;
  final String paymentMethod;
  final String expeditionCourier;

  SellerOrder({
    required this.id,
    required this.sellerProducts,
    required this.quantity,
    required this.totalAmount,
    required this.orderDate,
    this.status = "Dikemas",
    this.paymentStatus = "Sudah dibayar",
    required this.paymentMethod,
    required this.expeditionCourier,
  });
}


