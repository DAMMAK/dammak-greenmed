import 'package:doctorappointment/widgets/navbar.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';

class EmergencyCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  "07034811040",
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
