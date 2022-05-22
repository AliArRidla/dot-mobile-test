import 'package:berdikari_absensi/theme.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: double.infinity,
      width: 296,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  // primaryTextColor,
                  fieldColor,
                ),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text('Loading', style: textField.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
