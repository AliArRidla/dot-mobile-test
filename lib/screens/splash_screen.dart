import 'dart:async';

import 'package:dot/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // getInit();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, "/login"));
    super.initState();
  }

  // getInit() async {
  //   Navigator.pushNamed(context, "/login");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
