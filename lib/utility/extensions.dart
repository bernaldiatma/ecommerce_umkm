import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/core/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  UserProvider get dataProvider => Provider.of<UserProvider>(this, listen: false);
  //FavoriteProvider get favoriteProvider => Provider.of<FavoriteProvider>(this, listen: false);
}