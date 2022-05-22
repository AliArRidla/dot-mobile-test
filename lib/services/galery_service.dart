import 'dart:convert';

import 'package:berdikari_absensi/models/galery_model.dart';
import 'package:http/http.dart' as http;

class GaleryService {
  String baseUrl = 'https://dot-mobile-test.web.app';
  Future<List<GaleryModel>> getGalerys() async {
      var url = '$baseUrl/gallery.json';
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      
      var data = jsonDecode(response.body)['data'];
      List<GaleryModel> galeryModels = [];
      for (var item in data) {
        GaleryModel galeryModel = GaleryModel.fromJson(item);
        galeryModels.add(galeryModel);
      }
      return galeryModels;
    } else {
      throw Exception('Failed to load galery');
    }
  }
}
