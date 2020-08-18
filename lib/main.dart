import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/authentication/bloc/authentication_bloc.dart';
import 'package:doctorappointment/modules/authentication/login.dart';
import 'package:doctorappointment/modules/authentication/widgets/user_data.dart';
import 'package:doctorappointment/modules/covid19_news/bloc/covidnews_bloc.dart';
import 'package:doctorappointment/modules/onboarding/bloc/onboarding_bloc.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:doctorappointment/modules/visit_doctor/bloc/visitdoctor_bloc.dart';
import 'package:doctorappointment/modules/visit_doctor/models/appointment.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/modules/visit_doctor/pages/doctor_profile.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/routes/routes_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  // await seed();
  List<Map<String, dynamic>> _results = await DB.query(Appointment.tablename);
  print("my DB DAta => $_results.length");
  initializeDateFormatting().then((_) => runApp(UserData(child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => CovidnewsBloc()),
        BlocProvider(create: (context) => VisitdoctorBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initialRoute,
        onGenerateRoute: routes,
        theme: ThemeData(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
        title: 'Doctor Appointment',
        home: Login(),
      ),
    );
  }
}
