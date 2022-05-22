import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:berdikari_absensi/models/absen_model.dart';
import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:berdikari_absensi/providers/attendance_provider.dart';
import 'package:berdikari_absensi/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:berdikari_absensi/models/user_model.dart';
import 'package:berdikari_absensi/providers/auth_provider.dart';
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
  String _timeString;
  String _timeStringUtc;
  String gambar;
  File _image;
  final imagePicker = ImagePicker();
  Position _currentPosition;
  String _currentAddress;

  UserModel user = new UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    _getCurrentLocation();
  }

  // ambil data lokasi nya
  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  // method jam berjalan
  void _getTime() {
    final String formattedDateTime =
        DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    // var formattedDateTimePost = DateFormat('dd-MM-yyyy hh:mm aa');

    var utcDate = DateTime.now().toUtc().toString();
    // 'yyyy-MM-dd \n
    setState(() {
      _timeString = formattedDateTime;
      _timeStringUtc = utcDate;
      // print(_timeString);
    });
  }

  // get data daftar hadir
  getData(String token) async {
    await Provider.of<AttendanceProvider>(context, listen: false)
        .getDataAttendances(token);
    // Navigator.pushNamed(context, '/history');
  }

  // method camera panggil
  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      final bytes = _image.readAsBytesSync();
      String base64Image = "data:image/png;base64," + base64Encode(bytes);
      gambar = base64Image;
    });
  }

  int idValue;
  void getIdAttendance() async {
    SharedPreferences attendancePrefs = await SharedPreferences.getInstance();
    setState(() {
      idValue = attendancePrefs.getInt('attendanceId');
      attendancePrefs.setInt('attendanceId', idValue);
    });

    // print(attendanceProvider.attendanceModel.attendanceId);
    //   getData(token);

    // attendanceProvider.attendanceModel.attendanceId;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AttendanceProvider attendanceProvider =
        Provider.of<AttendanceProvider>(context);
    int idAttendance = attendanceProvider.absenModel.attendanceId;
// int idAttendance = 90;
    String token = authProvider.user.token;
    UserModel user = authProvider.user;
    String nama = user.nama;
    AttendanceModel attendanceModel;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 9),
                child: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/profile.jpg'),
                  backgroundImage: NetworkImage('${user.gambar}'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${user.nama}', style: textSubHeading),
                  Text('${user.jabatan}', style: textBody),
                ],
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.blue[900],
                ),
              ),
            )
          ],
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 7),
                  child: Text(
                    _timeString.toString(),
                    // DateFormat('MM/dd/yyyy hh:mm:ss').format(DateTime.now()),
                    style: textTitle.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Text('Hallo ' + nama.split(' ').first, style: textHeading),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 10),
                  child: Text('Semangat kerja!!', style: textSubHeading),
                ),
              ],
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  width: 327,
                  height: 62,
                  decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),

                            if (_currentAddress != null)
                              SizedBox(
                                width: 150,
                                child: Text(
                                  _currentAddress,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: textSubHeading.copyWith(
                                      color: primaryColor),
                                ),
                              ),

                            if (_currentAddress == null)
                              Text(
                                "Lokasi belum ada...",
                                style: textSubHeading.copyWith(
                                    color: primaryColor),
                              ),

                            //   Text(_currentPosition.toString(),
                            //       style: textSubHeading.copyWith(
                            //           color: primaryColor)),
                            // if(_currentPosition )
                          ],
                        ),
                        InkWell(
                          child: Icon(Icons.refresh, color: primaryColor),
                          onTap: () => _getAddressFromLatLng(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 205,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xffe5e5e5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 28,),
                        if (_currentPosition != null)
                          // Text(
                          // "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"
                          // ),
                          Text('Pastikan kamu ada di kantor',
                              style: textSubHeading),
                        Text('Jam kerja kamu pukul 08:00 - 17:00 WIB',
                            style: textBody),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              // ketika di klik ambil data dari model
                              onTap: () async {
                                // _getCurrentLocation();
                                _getAddressFromLatLng();
                                final image = await imagePicker.getImage(
                                    source: ImageSource.camera);
                                // setState(() {
                                _image = File(image.path);
                                final bytes =
                                    _image.readAsBytesSync(); // mulai convert
                                String base64Image = "data:image/png;base64," +
                                    base64Encode(bytes);
                                gambar = base64Image;
                                // final bytes = Io.File('bezkoder.png').readAsBytesSync();
                                // String img64 = base64Encode(bytes);
                                // print(img64.substring(0, 100));
                                // });
                                // await attendanceProvider.attendanceIn(
                                //   employeeId: authProvider.user.id,
                                //   checkIn: _timeString,
                                //   // imgIn: gambar,
                                // );
                                print(gambar);
                                await attendanceProvider.attendanceIn(
                                  employeeId: authProvider.user.id,
                                  checkIn: _timeStringUtc,
                                  latitudeIn:
                                      _currentPosition.latitude.toString(),
                                  longitudeIn:
                                      _currentPosition.longitude.toString(),
                                  locationNameIn: _currentAddress,
                                  // imgIn: getImage().toString(),
                                  imgIn: "",
                                  token: token,
                                );
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color(0xff2f539d),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Text(
                                      'Masuk',
                                      style: textBody.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                await attendanceProvider.getIdAttendance(token);
                                _getAddressFromLatLng();
                                attendanceProvider.attendanceOut(
                                    // employeeId: authProvider.user.id,
                                    checkOut: _timeStringUtc,
                                    latitudeOut:
                                        _currentPosition.latitude.toString(),
                                    longitudeOut:
                                        _currentPosition.longitude.toString(),
                                    locationNameOut: _currentAddress,
                                    // imgOut: gambar,
                                    imgOut: "",
                                    token: token,
                                    // TODO: get id from model
                                    // attendanceId: _attendanceId
                                    attendanceId: idAttendance
                                    // attendanceId: getIdAttendance,
                                    );

                                // );
                                // print(attendanceProvider);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color(0xffe4e4e4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Text(
                                      'Pulang',
                                      style: textBody.copyWith(
                                          color: primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffefefef),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Absen di luar kantor',
                                style: textBody.copyWith(color: primaryColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
