import 'dart:convert';

import 'package:berdikari_absensi/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  String baseUrl = 'https://dot-mobile-test.web.app';

  Future<ProfileModel> getProfile() async {
    var url = '$baseUrl/user.json';
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    print(response);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      ProfileModel profile = ProfileModel.fromJson(data);
      print(profile);
      return profile;
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
