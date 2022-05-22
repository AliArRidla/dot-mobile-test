import 'dart:convert';

import 'package:berdikari_absensi/models/absen_model.dart';
import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:berdikari_absensi/services/attendance_services.dart';
import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  List<AttendanceModel> _attendances = [];
  List<AttendanceModel> get attendances => _attendances;

  AttendanceModel _attendanceModel;
  AttendanceModel get attendanceModel => _attendanceModel;

  set attendanceModel(AttendanceModel attendanceModel) {
    _attendanceModel = attendanceModel;
    notifyListeners();
  }

  AbsenModel _absenModel = AbsenModel();
  AbsenModel get absenModel => _absenModel;

  set absenModel(AbsenModel absenModel) {
    _absenModel = absenModel;
    notifyListeners();
  }

  set attendances(List<AttendanceModel> attendances) {
    _attendances = attendances;
    notifyListeners();
  }

  Future<void> getIdAttendance(String token) async {
    try {
      AbsenModel absenModel = await AttendanceServices().getIdAttendance(token);
      _absenModel = absenModel;
    } catch (e) {
      // throw Exception(e.toString());
      print(e);
    }
  }

  Future<void> getDataAttendances(String token) async {
    try {
      List<AttendanceModel> attendances =
          await AttendanceServices().getAttendance(token);
      _attendances = attendances;
    } catch (e) {
      print(e);
      print("gagal ambil data");
    }
  }

  Future<bool> attendanceIn({
    int employeeId, //data di dapatkan dari user login
    dynamic checkIn,
    dynamic latitudeIn,
    dynamic longitudeIn,
    dynamic locationNameIn,
    dynamic imgIn,
    dynamic token,
    dynamic attendanceId,
    dynamic description,
  }) async {
    try {
      // store data nya

      AttendanceModel attendanceModel = await AttendanceServices().attendanceIn(
        employeeId: employeeId,
        checkIn: checkIn,
        latitudeIn: latitudeIn,
        longitudeIn: longitudeIn,
        locationNameIn: locationNameIn,
        imgIn: imgIn,
        token: token,
        attendanceId: attendanceId,
        description: description,
      );

      _attendanceModel = attendanceModel;
      // print(_attendanceModel);
      // return true;
    } catch (e) {
      print(e);
      print("gagal insert data masuk ");
      return false;
    }
  }

  Future<bool> attendanceOut({
    int employeeId, //data di dapatkan dari user login
    dynamic checkOut,
    dynamic latitudeOut,
    dynamic longitudeOut,
    dynamic locationNameOut,
    dynamic imgOut,
    dynamic token,
    dynamic attendanceId,
    dynamic description,
  }) async {
    try {
      // store data nya

      AttendanceModel attendanceModel =
          await AttendanceServices().attendanceOut(
        employeeId: employeeId,
        checkOut: checkOut,
        latitudeOut: latitudeOut,
        longitudeOut: longitudeOut,
        locationNameOut: locationNameOut,
        imgOut: imgOut,
        token: token,
        attendanceId: attendanceId,
        description: description,
      );

      // AbsenModel absenModel = await AttendanceServices().attendanceOut(
      //   attendanceId: attendanceId,
      //   description: description,
      // );

      // _absenModel = absenModel;
      _attendanceModel = attendanceModel;
      return true;
    } catch (e) {
      print(e);
      print("gagal insert data keluar ");
      return false;
    }
  }
}
