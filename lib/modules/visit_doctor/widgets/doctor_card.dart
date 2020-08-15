import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard({this.doctor});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.12,
      width: double.infinity,
      margin: EdgeInsets.only(top: height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        color: AppColors.homeButtonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.04),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/images/doctors/${doctor.imgUrl}"),
              SizedBox(
                width: width * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.008),
                  Text(
                    doctor.speciality,
                    style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.grey.withOpacity(0.9)),
                  ),
                ],
              ),
            ],
          ),
          Button(
            didHaveIcon: true,
            didHaveText: false,
            icon: Icons.arrow_forward_ios,
            width: width * 0.15,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
