import 'package:berdikari_absensi/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Place",
          style: headingTextStyle,
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Halaman Home"),
        ),
      ),
    );
  }
}
