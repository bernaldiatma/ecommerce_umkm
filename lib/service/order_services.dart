import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_umkm/models/order.dart';
import 'package:ecommerce_umkm/models/order_detail.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:http/http.dart' as http;

class OrderServices {

  //ambil order per user
  Future<Map<String, dynamic>> getOrder(String id) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/order/user/$id'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as Map<String, dynamic>;
      var order = Order.fromJson(result);
      return {'status': true, 'data': order};
    } else {
      return {'status': false, 'data': 'id not found'};
    }
  }

  //ambil order per id
  Future<Map<String, dynamic>> getOrderById(String id) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/order/id/$id'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as Map<String, dynamic>;
      var order = Order.fromJson(result);
      return {'status': true, 'data': order};
    } else {
      return {'status': false, 'data': 'id not found'};
    }
  }

  //buat order baru
  Future<Map<String, dynamic>> addOrder(String storeId, String userId, int qty, double price, double total, paymentMethod) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/order/new'),
        body: {
          "store_id": storeId,
          "user_id": userId,
          "qty": qty,
          "price": price,
          "total": total,
          "payment_method": paymentMethod,
        }
    );
    var result = jsonDecode(req.body) as Map<String, dynamic>;
    print(result);
    if (req.statusCode == 200) {
      return {'status': true, 'order_id': result['_id']};
    } else {
      return {'status': false};
    }
  }

  Future<Map<String, dynamic>> addOrderDetail(String orderId, List<OrderDetail> od) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/order/detail'),
        body: {
          "order_id": orderId,
          "order_detail": od
        }
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  Future<Map<String, dynamic>> updateOrderStatus(String orderId, String status) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/order/status/$orderId'),
        body: {
          "order_status": status
        }
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }
  Future<Map<String, dynamic>> updatePaymentStatus(String orderId, String status) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/order/payment/$orderId'),
        body: {
          "payment_status": status
        }
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

}