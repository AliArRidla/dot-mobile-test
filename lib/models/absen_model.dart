import 'package:berdikari_absensi/models/attendance_model.dart';

class AbsenModel{
  dynamic attendanceId;
  dynamic description;

  AbsenModel({
    this.attendanceId,
    this.description,
  });

  AbsenModel.fromJson(Map<dynamic, dynamic> json) {
    attendanceId = json['attendance_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'attendance_id': attendanceId,
      'description': description,
    };
  }
}

class UninitializedAbsenModel extends AbsenModel {}
