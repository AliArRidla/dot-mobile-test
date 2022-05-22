import 'package:berdikari_absensi/models/galery_model.dart';
import 'package:berdikari_absensi/services/galery_service.dart';
import 'package:flutter/material.dart';

class GaleryProvider with ChangeNotifier {
  List<GaleryModel> _galeryModels = [];
  List<GaleryModel> get galeryModels => _galeryModels;

  set galeryModels(List<GaleryModel> galeryModels) {
    _galeryModels = galeryModels;
    notifyListeners();
  }

  Future<void> getGalerys() async {
    try {
      List<GaleryModel> galeryModels = await GaleryService().getGalerys();
      _galeryModels = galeryModels;
    } catch (e) {
      print(e);
    }
  }
}