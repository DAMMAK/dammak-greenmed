import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor doctor;

  DoctorProfile({this.doctor});
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    // print("Doctor => $doctor");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            Container(
              height: height * 0.5,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: width,
                    //   color: Colors.lime,
                    //   child: _vouchedPatient(),
                    // ),
                    SizedBox(height: height * 0.05),
                    _workingTime(),
                    SizedBox(height: height * 0.05),
                    _education(),
                    SizedBox(height: height * 0.05),
                    _biography()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]),
                child: Center(
                  child: Button(
                    didHaveText: true,
                    didHaveIcon: false,
                    width: width * 0.9,
                    text: "Book an appointment",
                    fontSize: width * 0.05,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Routes.chooseDate, arguments: doctor);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _header() => Stack(
        children: [
          Container(
            height: height * 0.35,
            decoration: BoxDecoration(
                color: AppColors.homeButtonColor,
                borderRadius: BorderRadius.all(Radius.circular(width * 0.07))),
          ),
          Container(
            height: height * 0.37,
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  NavBar(),
                  SizedBox(height: height * 0.04),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(width * 0.01),
                        child: Hero(
                          tag: doctor.imgUrl,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                            child: Image.asset(
                              "assets/images/doctors/${doctor.imgUrl}",
                              width: width * 0.33,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.imageBorderColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(width * 0.03))),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            doctor.name,
                            style: TextStyle(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            doctor.speciality,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "${doctor.yearExperience} yrs of experience",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _vouchedPatient() {
    return Positioned(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: height * 0.07,
              width: height * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
              ),
            ),
          ),
          Positioned(
            left: -(width * 0.2),
            child: Container(
              height: height * 0.07,
              width: height * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            left: -(width * 0.1),
            child: Container(
              height: height * 0.07,
              width: height * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            left: -(width * 0.004),
            child: Container(
              height: height * 0.07,
              width: height * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
            ),
          ),
          Positioned(
            left: -(width * 0.0001),
            child: Container(
              height: height * 0.07,
              width: height * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
          // Positioned(
          //   left: 100,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.all(Radius.circular(width * 0.09)),
          //     child: Image.asset("assets/images/patient1.png",
          //         height: height * 0.06, width: height * 0.06),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _workingTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Working Time",
          style: TextStyle(
            fontSize: width * 0.046,
            fontWeight: FontWeight.w900,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Mon - Fri ${doctor.workTimeStart} - ${doctor.workTimeEnd}",
          style: TextStyle(
            fontSize: width * 0.046,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _education() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Education",
          style: TextStyle(
            fontSize: width * 0.046,
            fontWeight: FontWeight.w900,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "\u2022 Medical degree at NYU - 2004",
          style: TextStyle(
            fontSize: width * 0.046,
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.012),
        Text(
          "\u2022 Pediartics degree at stanford - 2010",
          style: TextStyle(
            fontSize: width * 0.046,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _biography() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Biography",
            style: TextStyle(
              fontSize: width * 0.046,
              fontWeight: FontWeight.w900,
              color: Colors.black.withOpacity(0.3),
            )),
        Text(
          doctor.biography,
          style: TextStyle(fontSize: width * 0.044, height: 2.0),
        )
      ],
    );
  }
}
