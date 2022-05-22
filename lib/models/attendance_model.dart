class AttendanceModel {
  int id;
  dynamic imgIn;
  dynamic checkIn;
  dynamic latitudeIn;
  dynamic longitudeIn;
  dynamic locationNameIn;

  dynamic imgOut;
  dynamic checkOut;
  dynamic latitudeOut;
  dynamic longitudeOut;
  dynamic locationNameOut;

  // List<dynamic> employeeId;
  dynamic attendanceId;
  dynamic description;

  AttendanceModel({
    // this.employeeId,
    this.id,
    this.checkIn,
    this.checkOut,
    this.latitudeIn,
    this.latitudeOut,
    this.longitudeIn,
    this.longitudeOut,
    this.locationNameIn,
    this.locationNameOut,
    this.imgIn,
    this.imgOut,
    // this.employeeId,
    this.attendanceId,
    this.description,
  });

  AttendanceModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    latitudeIn = json['latitude_in'];
    latitudeOut = json['latitude_out'];
    longitudeIn = json['longitude_in'];
    longitudeOut = json['longitude_out'];
    locationNameIn = json['location_name_in'];
    locationNameOut = json['location_name_out'];
    imgIn = json['img_in_url'];
    imgOut = json['img_out_url'];
    // employeeId = json['employee_id'].cast<dynamic>();
    // attendanceId = json['attendance_id'];
    // description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'check_in': checkIn,
      'check_out': checkOut,
      'latitude_in': latitudeIn,
      'latitude_out': latitudeOut,
      'longitude_in': longitudeIn,
      'longitude_out': longitudeOut,
      'location_name_in': locationNameIn,
      'location_name_out': locationNameOut,
      'img_in_url': imgIn,
      'img_out_url': imgOut,
      // 'employee_id': employeeId,
      'attendance_id': attendanceId,
      'description': description,
    };
  }
}

class UninitializedAttendanceModel extends AttendanceModel {}
