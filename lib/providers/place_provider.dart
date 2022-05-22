import 'package:berdikari_absensi/models/galery_model.dart';
import 'package:berdikari_absensi/models/place_model.dart';
import 'package:berdikari_absensi/services/galery_service.dart';
import 'package:berdikari_absensi/services/place_service.dart';
import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  List<PlaceModel> _placeModels = [];
  List<PlaceModel> get placeModels => _placeModels;

  set placeModels(List<PlaceModel> placeModels) {
    _placeModels = placeModels;
    notifyListeners();
  }

  Future<void> getPlaces() async {
    try {
      List<PlaceModel> placeModels = await PlaceService().getPlaces();
      _placeModels = placeModels;
    } catch (e) {
      print(e);
    }
  }
}