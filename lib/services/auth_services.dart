import 'dart:convert';
import 'package:berdikari_absensi/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'http://192.168.19.220:9012/api/v1';
  String baseUrl = 'http://203.161.24.135:9012/api/v1';
  // login
  Future<UserModel> login({
    String username,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': username,
      'password': password,
    });
    var response = await http.post(
      // (Uri.parse(url)),
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result']['data'];
      UserModel employee = UserModel.fromJson(data['hr_employee']);
      employee.token = 'Bearer ' + data['refresh_token'];

      return employee;
    } else {
      throw Exception("Gagal login");
    }
  }
}
