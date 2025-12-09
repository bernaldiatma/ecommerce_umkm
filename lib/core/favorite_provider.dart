import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/models/user.dart';
import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:ecommerce_umkm/utility/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final ApiServices api;
  List<Product> _favorites = [];
  List<Product> get favorites => _favorites;
  late User _user;

  FavoriteProvider({required this.api}) {
    _initState();
  }

  void _initState() async {
    var id = await Prefs.readAuth();
    _user = id['user'] as User;
    var prodFavorite = await api.product.getFavorite(_user.id);
    _favorites = prodFavorite['data'] as List<Product>;
  }

  void toggleFavorite(Product product) async {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
      await api.product.removeFavorite(_user.id, product.id);
    } else {
      _favorites.add(product);
      await api.product.addFavorite(_user.id, product.id);
    }
    notifyListeners();
  }

  bool isExist(Product product) => _favorites.contains(product);

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
