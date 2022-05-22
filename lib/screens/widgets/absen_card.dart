import 'package:berdikari_absensi/models/attendance_model.dart';
import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  AttendanceModel attendance;
  AttendanceCard(this.attendance);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xff2f539d),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 13,
            height: 61,
            decoration: BoxDecoration(
              color: const Color(0xff2f539d),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Mar",
                    style: const TextStyle(
                        color: const Color(0xff808080),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.center),
                Text(
                  '28',
                  style: TextStyle(
                    color: Color(0xff474747),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Senin',
                style: TextStyle(
                  color: Color(0xff474747),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'IT Departement',
                style: TextStyle(
                  color: Color(0xff949494),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Masuk  : 07:00 UTC',
                // attendance.attendance.checkIn,
                style: TextStyle(
                  color: Color(0xff2f539d),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Pulang : 17:00 UTC',
                style: TextStyle(
                  color: Color(0xff2f539d),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
