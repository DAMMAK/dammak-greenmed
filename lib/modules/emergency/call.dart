import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/widgets/navbar.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class EmergencyCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // Trigger Device Dialer to make the phone call
    // NB it doesn't work on emulator except real device
    Future.delayed(Duration(seconds: 2), () async {
      var phoneNumber = "tel://${AppConfig.EMERGENCY_NUMBER.toString()}";
      if (await canLaunch(phoneNumber)) {
        // check if it can make call on the device then make call
        await launch(phoneNumber);
      } else {
        throw "Can't phone that number.";
      }
    });
    return ScaffoldWithNav(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.2),
                Text(
                  "Calling..",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  AppConfig.EMERGENCY_NUMBER.toString(),
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
