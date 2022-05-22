import 'dart:async';
import 'package:berdikari_absensi/providers/galery_provider.dart';
import 'package:berdikari_absensi/providers/place_provider.dart';
import 'package:berdikari_absensi/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, "/login"));
    getAllData();
    super.initState();
  }

  getAllData() async {
    await Provider.of<ProfileProvider>(context, listen: false).getProfile();
    await Provider.of<GaleryProvider>(context, listen: false).getGalerys();
    await Provider.of<PlaceProvider>(context, listen: false).getPlaces();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logoi.png',
          height: 145,
          width: 145,
        ),
      ),
    );
  }
}
