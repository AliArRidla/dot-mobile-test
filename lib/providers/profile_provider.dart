import 'package:berdikari_absensi/models/profile_model.dart';
import 'package:berdikari_absensi/services/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel _profileModel;

  set profile(ProfileModel profile){
    _profileModel = profile;
    notifyListeners();
  }

  Future<void> getProfile() async {
    ProfileModel profileModel = await ProfileService().getProfile();
    _profileModel = profileModel;
  }
  
}
