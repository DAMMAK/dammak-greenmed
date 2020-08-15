import 'package:doctorappointment/modules/visit_doctor/models/doctor_tabs.dart';
import 'package:doctorappointment/modules/visit_doctor/widgets/tabs.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';

class BookDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ScaffoldWithNav(
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "Choose\na Doctor",
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        DoctorsTab(
          tabs: doctorTabs,
        ),
      ],
    );
  }
}
