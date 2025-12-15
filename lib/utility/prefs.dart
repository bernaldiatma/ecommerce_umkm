import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_umkm/models/user.dart';

class Prefs {
  static Future<void> saveAuthInfo(String userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authInfo', userInfo);
  }

  static Future<Map<String, dynamic>> readAuth() async {
    final prefs = await SharedPreferences.getInstance();
    bool status = false;
    var result = prefs.getString('authInfo')!.split(';');
      status = true;
      var user = User(
        id: result[0],
        username: result[1],
        email: result[2],
        password: '-',
        role: result[3],
        deleted: false,
        createdAt: '-',
        updatedAt: '-',
      );
    return {'status': status, 'user': user};
  }

  static Future<void> saveLogin(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', login);
  }

  static Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var result = prefs.getBool('isLoggedIn');
    if (result != null && result) return true;
    return false;
  }

  static Future<bool> cek() async {
    var result = await Future.delayed(Duration(seconds: 2), ()=> 10);
    if (result >= 5) return true;
    return false;
  }

  static Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.setString('authInfo', '');
    return true;
  }
}
