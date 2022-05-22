import 'package:berdikari_absensi/providers/attendance_provider.dart';
import 'package:berdikari_absensi/screens/home_screen.dart';
import 'package:berdikari_absensi/screens/login_screen.dart';
import 'package:berdikari_absensi/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berdikari_absensi/routes.dart';
import 'package:berdikari_absensi/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AttendanceProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "DOT APP", 
          initialRoute: '/splash',       
          // routes: routes,
          routes: {
             '/splash' : (context) => SplashScreen(),
             '/login' : (context) => LoginScreen(),
             '/home' : (context) => HomeScreen(),             
            //  '/history' : (context) => HistoryScreen(),
          },
        
      ),
    );
  }
}
