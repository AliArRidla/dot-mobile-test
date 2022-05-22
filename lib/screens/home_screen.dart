import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:berdikari_absensi/providers/place_provider.dart';
import 'package:berdikari_absensi/theme.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlaceProvider placeProvider = Provider.of<PlaceProvider>(context);
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
        child: ListView(
          // children: <Widget>[
          //   Container(
          //     padding: EdgeInsets.all(15),
          //     child: Text('Flutter Widget: Penggunaan ListView Class',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          //   ),
          //   Container(
          //     padding: EdgeInsets.all(15),
          //     child: Text('''Lorem Ipsum adalah contoh teks atau ...''',
          //         style: TextStyle(fontSize: 16)),
          //   ),
          // ],
          children: placeProvider.placeModels.map(
            (place) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultmargin),
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset(
                          'assets/images/logoi.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.title,
                            style: textSubHeading,
                          ),
                          Text(
                            "Type : " + place.type,
                            style: textBody,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
