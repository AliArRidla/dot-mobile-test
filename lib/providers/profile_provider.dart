import 'package:berdikari_absensi/models/profile_model.dart';
import 'package:berdikari_absensi/services/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel _profile;
  ProfileModel get profile => _profile;
  set profile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }

  Future<void> getProfile() async {
    try {
      ProfileModel profileModel = await ProfileService().getProfile();
      _profile = profileModel;
    } catch (e) {
      print(e);
    }
  }
}
