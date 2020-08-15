import 'package:doctorappointment/modules/authentication/home.dart';
import 'package:doctorappointment/modules/authentication/login.dart';
import 'package:doctorappointment/modules/covid19_news/news.dart';
import 'package:doctorappointment/modules/direction/direction.dart';
import 'package:doctorappointment/modules/emergency/call.dart';
import 'package:doctorappointment/modules/onboarding/sign_up.dart';
import 'package:doctorappointment/modules/visit_doctor/book_doctor.dart';
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
    case Routes.bookDoctor:
      return FadeRoute(page: BookDoctor());
      break;
    case Routes.covid19News:
      return FadeRoute(page: CovidNews());
      break;
    case Routes.emergencyCall:
      return FadeRoute(page: EmergencyCall());
      break;
    case Routes.direction:
      return FadeRoute(page: Direction());
      break;
    default:
  }
};
