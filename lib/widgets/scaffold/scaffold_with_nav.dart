import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/navbar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNav extends StatelessWidget {
  final Color bgColor;
  final List<Widget> children;
  ScaffoldWithNav({
    this.bgColor = AppColors.pageBgColor,
    @required this.children,
  });
  @override 
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              NavBar(),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
