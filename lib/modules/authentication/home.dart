import 'package:doctorappointment/modules/authentication/widgets/home_button.dart';
import 'package:doctorappointment/modules/authentication/widgets/user_data.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/utils/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.045),
              Text(
                "Welcome, ${DisplayUtil.getFirstName(UserData.of(context).user.name)}",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: height * 0.045),
              Expanded(
                child: ListView(
                  children: [
                    HomeButton(
                      text: "Visit a Doctor",
                      image: SvgPicture.asset("assets/images/testoscope.svg"),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.bookDoctor);
                      },
                    ),
                    HomeButton(
                      text: "Prescription",
                      image: SvgPicture.asset("assets/images/notepad.svg"),
                    ),
                    HomeButton(
                      text: "Direction",
                      image: SvgPicture.asset("assets/images/compass.svg"),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.direction);
                      },
                    ),
                    HomeButton(
                      text: "Covid-19",
                      image: SvgPicture.asset("assets/images/call.svg"),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.covid19News);
                      },
                    ),
                    HomeButton(
                      text: "Emergency",
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.emergencyCall);
                      },
                      image: SvgPicture.asset("assets/images/abulance.svg"),
                    ),
                    HomeButton(
                      color: AppColors.dischargeBtnBackground,
                      text: "Discharged",
                      textColor: Colors.white,
                      image: SvgPicture.asset(
                        "assets/images/error.svg",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
