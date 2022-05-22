import 'dart:convert';

import 'package:berdikari_absensi/models/galery_model.dart';
import 'package:berdikari_absensi/models/place_model.dart';
import 'package:http/http.dart' as http;

class PlaceService {
  String baseUrl = 'https://dot-mobile-test.web.app';
  Future<List<PlaceModel>> getGalerys() async {
      var url = '$baseUrl/place.json';
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      
      var data = jsonDecode(response.body)['data']['content'];
      List<PlaceModel> placeModels = [];
      for (var item in data) {
        PlaceModel galeryModel = PlaceModel.fromJson(item);
        placeModels.add(galeryModel);
      }
      return placeModels;
    } else {
      throw Exception('Failed to load galery');
    }
  }
}
