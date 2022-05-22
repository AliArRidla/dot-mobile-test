import 'package:berdikari_absensi/screens/home_screen.dart';
import 'package:berdikari_absensi/screens/login_screen.dart';
import 'package:berdikari_absensi/screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  // ignore: prefer_const_constructors
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName:(context) => HomeScreen(),
  
};