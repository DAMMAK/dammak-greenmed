import 'package:doctorappointment/modules/authentication/bloc/authentication_bloc.dart';
import 'package:doctorappointment/modules/authentication/model/login.dart';
import 'package:doctorappointment/modules/authentication/widgets/user_data.dart';
import 'package:doctorappointment/modules/covid19_news/service/api_client.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/button.dart';
import 'package:doctorappointment/widgets/form/input_password.dart';
import 'package:doctorappointment/widgets/form/input_text.dart';
import 'package:doctorappointment/widgets/login_dialog.dart';
import 'package:doctorappointment/widgets/platform/platform_dialog.dart';
import 'package:doctorappointment/widgets/platform/platform_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double height;
  double width;
  // Dialog manager manages every dialog widgets in Login screen
  DialogManager _dialogManager;
  // to enable and disable Form Autovalidation
  bool _autoValidation = false;
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  // model class to save user input data e.g phone number and password
  LoginModel model = LoginModel();
  final _formKey = GlobalKey<FormState>();
  AuthenticationBloc _bloc;
  final FocusNode _phoneNumberNode = FocusNode();

  final FocusNode _passwordNode = FocusNode();

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
    _bloc = BlocProvider.of<AuthenticationBloc>(context);
    _dialogManager = DialogManager(height: height, width: width);

    // input form field widget height
    double inputHeight = height * 0.06;
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // if login successful
        if (state is AuthenticationSuccessful) {
          // saved to data
          UserData.of(context).user = state.user;
          // navigate to home
          Navigator.of(context).pushReplacementNamed(Routes.home);
        }
        if (state is AuthenticationFailed) {
          // Show Alert Dialog with error message
          _dialogManager.showMessageDialog(context, message: state.message);
        }
        if (state is LoadingOn) {
          // Show Alert Dialog loader
          _dialogManager.showLoadingDialog(context);
        }
        if (state is LoadingOff) {
          // Remove the  current Dialog loader;
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.07),
                    SvgPicture.asset("assets/images/login_bg.min.svg"),
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
                    Form(
                      autovalidate: _autoValidation,
                      key: _formKey,
                      child: Column(
                        children: [
                          InputText(
                            height: inputHeight,
                            controller: _phoneController,
                            hintText: "PhoneNumber",
                            keyboardType: TextInputType.phone,
                            inputAction: TextInputAction.next,
                            focusNode: _phoneNumberNode,
                            // onFieldSubmitted: () {
                            //   _fieldFocusChange(
                            //       context, _phoneNumberNode, _passwordNode);
                            // },
                            bgColor: Colors.transparent,
                            onSaved: (String value) {
                              model.phoneNumber = value;
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
                            focusNode: _passwordNode,
                            controller: _passwordController,
                            bgColor: Colors.transparent,
                            onSaved: (String value) {
                              model.password = value;
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
                          SizedBox(height: height * 0.02),
                          Button(
                            didHaveText: true,
                            didHaveIcon: false,
                            height: height * 0.06,
                            width: width * 0.9,
                            text: "Login",
                            onPressed: () {
                              if (!_autoValidation)
                                setState(() {
                                  _autoValidation = true;
                                });
                              if (_formKey.currentState.validate()) {
                                model.password = _passwordController.text;
                                model.phoneNumber = _phoneController.text;
                                _bloc.add(DoLogin(loginModel: model));
                              }
                              //Covid19NewClient().getNews();
                              //_showMyDialog();
                            },
                          ),
                        ],
                      ),
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
      },
    );
  }

// Change Focus to the next Field
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
