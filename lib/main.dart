import 'package:doctorappointment/modules/authentication/login.dart';
import 'package:doctorappointment/routes/routes.dart';
import 'package:doctorappointment/routes/routes_object.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      onGenerateRoute: routes,
      theme: ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      title: 'Doctor Appointment',
      home: Login(),
    );
  }
}
