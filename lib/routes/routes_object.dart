import 'package:doctorappointment/modules/authentication/home.dart';
import 'package:doctorappointment/modules/authentication/login.dart';
import 'package:doctorappointment/modules/onboarding/sign_up.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:flutter/material.dart';

import 'animation/fade.dart';

var routes = (RouteSettings settings) {
  switch (settings.name) {
    case Routes.initialRoute:
      return FadeRoute(page: Login());
      break;
    case Routes.onboarding:
      return FadeRoute(page: SignUp());
      break;
    case Routes.home:
      return FadeRoute(page: Home());
      break;
    default:
  }
};
