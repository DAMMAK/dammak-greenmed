import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/form/input_password.dart';
import 'package:doctorappointment/widgets/form/input_text.dart';
import 'package:doctorappointment/widgets/navbar.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double height;
  double width;
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  TextEditingController _fullNameController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // input form field widget height
    double inputHeight = height * 0.06;
    return ScaffoldWithNav(
      children: [
        Text(
          "Signup",
          style: TextStyle(
            fontSize: width * 0.09,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: height * 0.045),
        Text(
          "Please ensure to provide the correct details below.",
          style: TextStyle(fontSize: width * 0.047),
        ),
        SizedBox(height: height * 0.045),
        InputText(
          height: inputHeight,
          controller: _fullNameController,
          hintText: "Full Name",
          keyboardType: TextInputType.phone,
          bgColor: Colors.transparent,
          onchanged: (value) {
            print(value);
          },
        ),
        SizedBox(height: height * 0.02),
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
        SizedBox(height: height * 0.4),
        Button(
          didHaveText: true,
          didHaveIcon: false,
          height: height * 0.06,
          width: width * 0.9,
          text: "Signup",
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.initialRoute);
          },
        ),
      ],
    );
  }
}
