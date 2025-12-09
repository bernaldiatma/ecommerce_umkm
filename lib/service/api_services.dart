import 'package:ecommerce_umkm/service/user_service.dart';
import 'package:ecommerce_umkm/service/product_service.dart';
import 'package:ecommerce_umkm/service/order_services.dart';

class ApiServices {
  final UserServices user = UserServices();
  final ProductServices product = ProductServices();
  final OrderServices order = OrderServices();
}