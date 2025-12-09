import 'package:ecommerce_umkm/models/product.dart';

class OrderDetail {
  final String id;
  final String order;
  final Product product;
  final int qty;

  const OrderDetail({
    required this.id,
    required this.order,
    required this.product,
    required this.qty,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'order': String order,
      'product': Product p,
      'qty': int qty,
    } =>
      OrderDetail(
        id: id,
        order: order,
        product: p,
        qty: qty
      ),
    _ => throw const FormatException('Failed to load orderDetail'),
  };
}
