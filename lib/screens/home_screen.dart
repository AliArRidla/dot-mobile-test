import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:berdikari_absensi/models/absen_model.dart';
import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:berdikari_absensi/providers/attendance_provider.dart';
import 'package:berdikari_absensi/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:berdikari_absensi/models/user_model.dart';
import 'package:berdikari_absensi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static String routeName = "/home";
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel user = new UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("ini home"),
        ),
      ),
    );
  }
}
