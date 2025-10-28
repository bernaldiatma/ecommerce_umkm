import 'package:ecommerce_umkm/customer/core/data_provider.dart';
import 'package:ecommerce_umkm/seller/core/data_provider_seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  DataProvider get dataProvider => Provider.of<DataProvider>(this, listen: false);
}