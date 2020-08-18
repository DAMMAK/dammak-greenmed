import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/visit_doctor/models/appointment.dart';

class AppointmentClient {
  bookAppointment(Appointment appointment) async {
    try {
      await DB.insert(Appointment.tablename, appointment);
      return true;
    } catch (e) {}
  }
}
