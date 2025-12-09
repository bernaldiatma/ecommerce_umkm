import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:ecommerce_umkm/utility/prefs.dart';
import 'package:ecommerce_umkm/models/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  final ApiServices api;
  User? _user;
  bool _loading = false;
  bool _loggedIn = false;
  bool _correctCredentials = false;

  UserProvider({required this.api}) {
    _initState();
  }

  bool get isLoggedIn => _loggedIn;

  User? get user => _user;

  bool get loading => _loading;

  bool get correctCredentials => _correctCredentials;

  void toggleCorrectCredentials(bool status) => _correctCredentials = status;

  Future<void> _initState() async {
    _loading = true;
    notifyListeners();
    _loggedIn = await Prefs.checkLogin();
    if (_loggedIn) {
      var result = await Prefs.readAuth();
      _user = result['user'];
    }
    _loading = false;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _loading = true;
    notifyListeners();

    var result = await api.user.login(email, password);
    _loading = false;
    notifyListeners();
    print('result login: ${result['user'].toString()}');
    if (result!['status']) {
      _user = result['user'];
      print('dataUser: ${_user.toString()}');
      Prefs.saveAuthInfo(_user.toString());
      Prefs.saveLogin(true);
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String email, String password) async {
    _loading = true;
    notifyListeners();

    var data = await api.user.register(username, email, password);
    _loading = false;
    notifyListeners();
    if (data['status']) {
      _user = data['user'];
      return true;
    }
    return false;
  }

  //TODO nganu logout
  Future<void> logout() async {}

  //TODO function function untuk operasi edit profil
}
