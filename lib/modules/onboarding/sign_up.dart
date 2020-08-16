import 'package:doctorappointment/modules/onboarding/bloc/onboarding_bloc.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/form/input_password.dart';
import 'package:doctorappointment/widgets/form/input_text.dart';
import 'package:doctorappointment/widgets/navbar.dart';
import 'package:doctorappointment/widgets/scaffold/scaffold_with_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final _formKey = GlobalKey<FormState>();
  User user = User();
  bool _autovalidate = false;
  OnboardingBloc _bloc;
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<OnboardingBloc>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // input form field widget height
    double inputHeight = height * 0.06;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
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
            Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: [
                  InputText(
                    height: inputHeight,
                    controller: _fullNameController,
                    hintText: "Full Name",
                    keyboardType: TextInputType.phone,
                    bgColor: Colors.transparent,
                    onchanged: (value) {
                      print(value);
                    },
                    onSaved: (String value) {
                      user.name = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Full Name is required';
                      }
                      return null;
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
                    onSaved: (String value) {
                      user.phoneNumber = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Phone Number is required';
                      } else if (value.length < 11) {
                        return 'invalid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  InputPassword(
                    height: inputHeight,
                    hintText: "Password",
                    controller: _passwordController,
                    bgColor: Colors.transparent,
                    onSaved: (String value) {
                      user.password = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password is weak';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.38),
                  Button(
                    didHaveText: true,
                    didHaveIcon: false,
                    height: height * 0.06,
                    width: width * 0.9,
                    text: "Signup",
                    onPressed: () {
                      if (!_autovalidate)
                        setState(() {
                          _autovalidate = true;
                        });
                      if (_formKey.currentState.validate()) {
                        user.name = _fullNameController.text;
                        user.password = _passwordController.text;
                        user.phoneNumber = _phoneController.text;
                        _bloc.add(AddSignUpEvent(user: user));
                      }
                      //Navigator.pushReplacementNamed(context, Routes.initialRoute);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
