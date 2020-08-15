import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/form/input_password.dart';
import 'package:doctorappointment/widgets/form/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double height;
  double width;

  TextEditingController _phoneController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // input form field widget height
    double inputHeight = height * 0.06;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.07),
                SvgPicture.asset("assets/images/login_bg.svg"),
                SizedBox(height: height * 0.06),
                Text(
                  "Welcome to\nGreen medical clinic",
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "You can be connected to us and track your healing process with this app.",
                  style: TextStyle(
                    fontSize: width * 0.039,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: height * 0.05),
                InputText(
                  height: inputHeight,
                  controller: _phoneController,
                  hintText: "PhoneNumber",
                  keyboardType: TextInputType.phone,
                  bgColor: Colors.transparent,
                  onchanged: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: height * 0.02),
                InputPassword(
                  height: inputHeight,
                  hintText: "Password",
                  controller: _passwordController,
                  bgColor: Colors.transparent,
                ),
                SizedBox(height: height * 0.02),
                Button(
                  didHaveText: true,
                  didHaveIcon: false,
                  height: height * 0.06,
                  width: width * 0.9,
                  text: "Login",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(fontSize: width * 0.035),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.onboarding);
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
