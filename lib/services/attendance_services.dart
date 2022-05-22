import 'dart:convert';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:berdikari_absensi/models/absen_model.dart';
import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:berdikari_absensi/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AttendanceServices {
  // String baseUrl = 'http://192.168.19.220:9012/api/v1';
  String baseUrl = 'http://203.161.24.135:9012/api/v1';

  AttendanceModel attendanceModel = AttendanceModel();

  Future<AbsenModel> getIdAttendance(String token) async {
    var url = '$baseUrl/myattendance-status';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var now = DateTime.now();
    var isUTCStart = DateTime(now.year, now.month, now.day, 0, 0, 0).toUtc();
    var isUTCEnd = DateTime(now.year, now.month, now.day, 23, 59, 59).toUtc();
    var formatMasuk = DateFormat('yyyy-MM-dd HH:mm:ss').format(isUTCStart);
    var formatKeluar = DateFormat('yyyy-MM-dd HH:mm:ss').format(isUTCEnd);
    var body = {
      'start_date': formatMasuk.toString(),
      'end_date': formatKeluar.toString()
    };
    var response =
        await http.post(url, headers: headers, body: json.encode(body));
    // final response = await http.get('$baseUrl/absen/' + id);
    print(body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result']['data'];
      AbsenModel absenModel = AbsenModel.fromJson(data);
      print(absenModel);
      return absenModel;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<AttendanceModel> attendanceIn({
    int employeeId, //data di dapatkan dari user login
    String checkIn,
    String latitudeIn,
    String longitudeIn,
    String locationNameIn,
    String imgIn,
    String token,
    dynamic attendanceId,
    dynamic description,
  }) async {
    var url = '$baseUrl/attendance';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    dynamic _data = {
      'employee_id': employeeId,
      'check_in': checkIn,
      'latitude_in': latitudeIn,
      'longitude_in': longitudeIn,
      'location_name_in': locationNameIn,
      'img_in': imgIn,
    };
    var body = jsonEncode({'data': _data});

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // print(response.body);
    // print(body);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // return response.body;
      var data = jsonDecode(response.body)['result']['data'];

      AttendanceModel attendanceModel = AttendanceModel.fromJson(data);

      // AbsenModel absenModel = AbsenModel.fromJson(data); // ???
      print(data);
      return attendanceModel;
    } else {
      throw Exception('Gagal Melakukan Absen');
    }
  }

  Future<AttendanceModel> attendanceOut({
    int employeeId, //data di dapatkan dari user login
    String checkOut,
    String latitudeOut,
    String longitudeOut,
    String locationNameOut,
    String imgOut,
    String token,
    String id,
    dynamic attendanceId, // ngga dapet data
    dynamic description,
  }) async {
    // var body = {};
    // var id = attendanceModel.attendanceId;
    var url = '$baseUrl/attendance/$attendanceId';
    // final url = Uri.http(baseUrl, '/attendance', {});

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    dynamic _data = {
      // 'employee_id': employeeId,
      'check_out': checkOut,
      'latitude_out': latitudeOut,
      'longitude_out': longitudeOut,
      'location_name_out': locationNameOut,
      'img_out': imgOut,
    };
    var body = jsonEncode({'data': _data});

    var response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    print(body);
    print(url);

    // if (response.statusCode == 200) {
    //   // return response.body;
    //   print(response.body);
    //   var data = jsonDecode(response.body)['result']['data'];
    //   print("hasil" + data);
    //   AttendanceModel attendanceModel = AttendanceModel.fromJson(data);
    //   // AbsenModel absenModel = AbsenModel.fromJson(data);
    //   // return attendanceModel;
    // } else {
    //   throw Exception('Gagal Melakukan Absen Keluar');
    // }
  }

  Future<List<AttendanceModel>> getAttendance(String token) async {
    var url = '$baseUrl/my-attendance';

    var headers = {
      'Authorization': token,
    };
    var response = await http.get(url, headers: headers);

    // print(response.body);
    if (response.statusCode == 200) {
      // print(response.body);
      List data = jsonDecode(response.body)['result']['data'];
      List<AttendanceModel> attendances = [];
      for (var item in data) {
        attendances.add(AttendanceModel.fromJson(item));
      }
      return attendances;
    } else {
      print(token);
      print("data gagal diambil");
    }
  }
}
