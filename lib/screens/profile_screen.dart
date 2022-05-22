import 'package:berdikari_absensi/models/profile_model.dart';
import 'package:berdikari_absensi/providers/profile_provider.dart';
import 'package:berdikari_absensi/screens/login_screen.dart';
import 'package:berdikari_absensi/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    ProfileModel profile = profileProvider.profile;

    Widget fotoProfile() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 30),
        width: 70,
        height: 70,
        child: CircleAvatar(
          backgroundColor: primaryColor,
          // backgroundImage: Image.network(profile.avatar),
          child: const Text('AA'),
        ),
      );
    }

    Widget namaProfile() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: fieldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama : ",
                style: textButtonTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                profile.nama,
                // "Ahmad",
                style: textButtonTextStyle.copyWith(color: primaryTextColor),
              ),
            ],
          ),
        ),
      );
    }

    Widget emailProfile() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: fieldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email nya :',
                style: textButtonTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                profile.email,
                // "emailmyaa",
                style: textButtonTextStyle.copyWith(color: primaryTextColor),
              ),
            ],
          ),
        ),
      );
    }

    Widget fullNameProfile() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: fieldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Lengkap :',
                style: textButtonTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                profile.namaLengkap,
                // "emailmyaa",
                style: textButtonTextStyle.copyWith(color: primaryTextColor),
              ),
            ],
          ),
        ),
      );
    }

    Widget phoneProfile() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: fieldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Hp :',
                style: textButtonTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                profile.phone,
                // "emailmyaa",
                style: textButtonTextStyle.copyWith(color: primaryTextColor),
              ),
            ],
          ),
        ),
      );
    }

    Widget logOut() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        height: 50,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Log out',
            style: textButtonTextStyle.copyWith(color: fieldColor),
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext ctx) => LoginScreen()));
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: headingTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultmargin),
        child: Column(
          children: [
            fotoProfile(),
            namaProfile(),
            fullNameProfile(),
            phoneProfile(),
            emailProfile(),
            logOut()
          ],
        ),
      ),
    );
  }
}
