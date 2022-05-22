import 'package:dot/screens/login_screens.dart';
import 'package:dot/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOT APP',
      // home: LoginScreen(),
      // home: SplashScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
