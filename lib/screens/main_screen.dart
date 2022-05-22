import 'package:berdikari_absensi/screens/home_screen.dart';
import 'package:berdikari_absensi/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedPage = 0;

final List<Widget> _myPages = [HomeScreen()];

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
      body: _myPages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Place',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: 'Galery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: selectedPage,
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
