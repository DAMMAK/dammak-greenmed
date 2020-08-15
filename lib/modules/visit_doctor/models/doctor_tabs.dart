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

var tabs = [
  DoctorTab(
    name: "GP",
    doctors: [
      Doctor(
          name: "Dr Lily Aldrin",
          speciality: "Neurologist",
          imgUrl: "doctor1.svg"),
      Doctor(
          name: "Dr. Ted Mosby",
          speciality: "Pediatrician",
          imgUrl: "doctor2.svg"),
      Doctor(
          name: "Dr. Emma Lee",
          speciality: "Dermatologist",
          imgUrl: "doctor3.svg"),
      Doctor(
          name: "Dr. Ross Geller",
          speciality: "Cardiologist",
          imgUrl: "doctor4.svg"),
      Doctor(
          name: "Dr. Amy Joy",
          speciality: "Gynecologist",
          imgUrl: "doctor5.svg")
    ],
  ),
  DoctorTab(
    name: "Specialist",
    doctors: [
      Doctor(
          name: "Dr Lily Aldrin",
          speciality: "Neurologist",
          imgUrl: "doctor1.svg"),
      Doctor(
          name: "Dr. Ted Mosby",
          speciality: "Pediatrician",
          imgUrl: "doctor2.svg"),
      Doctor(
          name: "Dr. Emma Lee",
          speciality: "Dermatologist",
          imgUrl: "doctor3.svg"),
      Doctor(
          name: "Dr. Ross Geller",
          speciality: "Cardiologist",
          imgUrl: "doctor4.svg"),
      Doctor(
          name: "Dr. Amy Joy",
          speciality: "Gynecologist",
          imgUrl: "doctor5.svg")
    ],
  ),
  DoctorTab(
    name: "Dentist",
    doctors: [
      Doctor(
          name: "Dr Lily Aldrin",
          speciality: "Neurologist",
          imgUrl: "doctor1.svg"),
      Doctor(
          name: "Dr. Ted Mosby",
          speciality: "Pediatrician",
          imgUrl: "doctor2.svg"),
      Doctor(
          name: "Dr. Emma Lee",
          speciality: "Dermatologist",
          imgUrl: "doctor3.svg"),
      Doctor(
          name: "Dr. Ross Geller",
          speciality: "Cardiologist",
          imgUrl: "doctor4.svg"),
      Doctor(
          name: "Dr. Amy Joy",
          speciality: "Gynecologist",
          imgUrl: "doctor5.svg")
    ],
  ),
  DoctorTab(
    name: "Therapist",
    doctors: [
      Doctor(
          name: "Dr Lily Aldrin",
          speciality: "Neurologist",
          imgUrl: "doctor1.svg"),
      Doctor(
          name: "Dr. Ted Mosby",
          speciality: "Pediatrician",
          imgUrl: "doctor2.svg"),
      Doctor(
          name: "Dr. Emma Lee",
          speciality: "Dermatologist",
          imgUrl: "doctor3.svg"),
      Doctor(
          name: "Dr. Ross Geller",
          speciality: "Cardiologist",
          imgUrl: "doctor4.svg"),
      Doctor(
          name: "Dr. Amy Joy",
          speciality: "Gynecologist",
          imgUrl: "doctor5.svg")
    ],
  )
];
DoctorTabs doctorTabs = DoctorTabs(
  tabs: tabs,
);
