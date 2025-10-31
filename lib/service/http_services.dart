import 'dart:convert';
import 'package:ecommerce_umkm/customer/models/user.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = BASE_URL;

  Future<dynamic> login(String email, String password) async {
    final response = await http.post(

      Uri.parse('$BASE_URL/api/user/login'), // alamat API

      body: {"email" : email, 'password' : password}, //parameter yang dikirim ke API

    );

    if (response.statusCode == 200) {  // 200 artinya status ok

      return{
        'status' : true,
        'user' : User.fromJson(jsonDecode(response.body) as Map<String, dynamic>)
      };

    } else {
      return {'status' : false};
    }
  }


  Future<dynamic> register(String username, String email, String password) async {

    final response = await http.post(

      Uri.parse('$BASE_URL/api/user/'),

      body: {"username" : username, "email" : email, 'password' : password},

    );
    print(response.body);
    if (response.statusCode == 200) {
      return {
        'status' : true,
        'user' : jsonDecode(response.body) as Map<String, dynamic>
      };

    } else {
      return { 'status' : false,};
    }
  }
}