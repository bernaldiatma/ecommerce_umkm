import 'dart:convert';
import 'package:ecommerce_umkm/models/user.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final req = await http.post(
      Uri.parse('$BASE_URL/api/user/login'), // alamat API
      body: {"email": email, 'password': password}, //parameter yang dikirim ke API
    );

    if (req.statusCode == 200) {
      // 200 artinya status ok
      return {
        'status': true,
        'user': User.fromJson(jsonDecode(req.body) as Map<String, dynamic>),
      };
    } else {
      return {'status': false};
    }
  }

  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final req = await http.post(
      Uri.parse('$BASE_URL/api/user/'),
      body: {"username": username, "email": email, 'password': password},
    );
    if (req.statusCode == 200) {
      return {'status': true, 'user': jsonDecode(req.body) as Map<String, dynamic>};
    } else {
      return {'status': false};
    }
  }
}
