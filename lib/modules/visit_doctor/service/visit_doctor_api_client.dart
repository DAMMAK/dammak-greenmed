import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor_tabs.dart';
import 'package:doctorappointment/modules/visit_doctor/widgets/tabs.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

class VisitDoctorClient {
  DoctorType _doctorType;
  getDoctors() async {
    try {
      var response = await DB.query(Doctor.tablename);
      List<Doctor> doctors = response.map((e) => Doctor.fromMap(e)).toList();
      var nDoctors = doctors.groupBy((m) => m.doctorType);
      var tabs = nDoctors.keys
          .map((e) => DoctorTab(
              name: DoctorType.values[e].name.toString(), doctors: nDoctors[e]))
          .toList();
      return DoctorTabs(tabs: tabs);
    } catch (e) {
      print(e);
    }
  }
}
