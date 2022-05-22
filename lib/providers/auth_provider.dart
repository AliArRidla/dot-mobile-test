// import 'package:berdikari_absensi/models/user_model.dart';
import 'package:berdikari_absensi/models/user_model.dart';
import 'package:berdikari_absensi/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // enkapsulasi
  UserModel _user;

  // getter
  UserModel get user => _user; //diakses nanti di home

  // setter
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // method login nya
  Future<bool> login({
    String username,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
