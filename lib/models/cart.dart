import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/models/user.dart';

class Cart {
  final User user;
  final Product product;
  int qty;

  Cart({required this.user, required this.product, required this.qty});

  factory Cart.fromJson(Map<String, dynamic> json) => switch (json) {
    {'user': User u, 'product': Product p, 'qty': int qty} => Cart(user: u, product: p, qty: qty),
    _ => throw const FormatException('Failed to load Cart'),
  };
}
