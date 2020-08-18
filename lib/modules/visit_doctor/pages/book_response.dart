import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookResponse extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/success_icon.svg"),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Successful",
              style: TextStyle(
                fontSize: width * 0.08,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Button(
              didHaveText: true,
              didHaveIcon: false,
              width: width * 0.5,
              height: height * 0.07,
              text: "Done",
              fontSize: width * 0.06,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
