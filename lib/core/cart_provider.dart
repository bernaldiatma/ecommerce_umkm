import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/models/cart.dart';
import 'package:ecommerce_umkm/models/user.dart';
import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:ecommerce_umkm/utility/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartProvider extends ChangeNotifier {
  final ApiServices api;
  List<Cart> _cart = [];

  List<Cart> get cart => _cart;
  late User _user;

  CartProvider({required this.api}) {
    _initState();
  }

  void _initState() async {
    var id = await Prefs.readAuth();
    _user = id['user'] as User;
  }

  void toggleProduct(Product product) {
    if (_cart.where((p) => p.product.id == product.id).isNotEmpty) {
      for (Cart item in _cart) {
        item.qty++;
      }
    } else {
      _cart.add(Cart(user: _user, product: product, qty: 1));
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void deleteFromCart(Product product) {
    _cart.remove(_cart.where((c) => c.product.id == product.id).first);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cart[index].qty++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    _cart[index].qty--;
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (Cart item in _cart) {
      total += item.product.price * item.qty;
    }
    return total;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
