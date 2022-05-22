import 'package:berdikari_absensi/providers/galery_provider.dart';
import 'package:berdikari_absensi/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GaleryScreen extends StatefulWidget {
  const GaleryScreen({Key key}) : super(key: key);

  @override
  State<GaleryScreen> createState() => _GaleryScreenState();
}

class _GaleryScreenState extends State<GaleryScreen> {
  @override
  Widget build(BuildContext context) {
    Widget galery() {
      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("He'd have you all unravel at the"),
      );
    }

    GaleryProvider galeryProvider = Provider.of<GaleryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Galery",
          style: headingTextStyle,
        ),
      ),
      body: Container(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: galeryProvider.galeryModels.map(
          (galery) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Image.network(galery.thumbnail),
            );            
          },
        ).toList(),
      )),
    );
  }
}
