import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';

class DoctorTabs {
  final List<DoctorTab> tabs;
  DoctorTabs({this.tabs});
}

class DoctorTab {
  final String name;
  final List<Doctor> doctors;
  DoctorTab({this.name, this.doctors});
}
