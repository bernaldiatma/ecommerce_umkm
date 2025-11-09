import 'package:ecommerce_umkm/core/data_provider.dart';
import 'package:ecommerce_umkm/customer/screens/product_favorite_screen/provider/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  DataProvider get dataProvider => Provider.of<DataProvider>(this, listen: false);
  //FavoriteProvider get favoriteProvider => Provider.of<FavoriteProvider>(this, listen: false);
}