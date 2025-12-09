import 'package:ecommerce_umkm/models/order_detail.dart';

class Order {
  final String id;
  final String storeName;
  final int qty;
  final double price;
  final double total;
  final String orderStatus;
  final String waybill;
  final String expeditionCourier;
  final String paymentMethod;
  final String paymentStatus;
  final List<OrderDetail> orderDetail;
  final String createdAt;
  final String updatedAt;
  final String deleted;

  Order({
    required this.id,
    required this.storeName,
    required this.qty,
    required this.price,
    required this.total,
    required this.orderStatus,
    required this.waybill,
    required this.expeditionCourier,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderDetail,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory Order.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'store_name': String storeName,
      'qty': int qty,
      'price': int price,
      'total': int total,
      'order_status': String orderStatus,
      'waybill': String waybill,
      'expedition_courier': String expeditionCourier,
      'payment_method': String paymentMethod,
      'payment_status': String paymentStatus,
      'order_detail': List<OrderDetail> orderDetail,
      'created_at': String createdAt,
      'updated_at': String updatedAt,
      'deleted': String deleted,
    } =>
      Order(
        id: id,
        storeName: storeName,
        qty: qty,
        price: price.toDouble(),
        total: total.toDouble(),
        orderStatus: orderStatus,
        waybill: waybill,
        expeditionCourier: expeditionCourier,
        paymentMethod: paymentMethod,
        paymentStatus: paymentStatus,
        orderDetail: orderDetail,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deleted: deleted,
      ),
    _ => throw const FormatException('Failed to load Order'),
  };
}
