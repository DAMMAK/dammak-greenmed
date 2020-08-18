import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/data/model.dart';

class Doctor extends BaseModel {
  static String tablename = AppConfig.DOCTOR_TABLE_NAME;
  int id;
  final String name;
  final String speciality;
  final String imgUrl;
  final int doctorType;
  final String biography;
  final int yearExperience;
  final String workTimeStart;
  final String workTimeEnd;

  Doctor({
    this.imgUrl,
    this.name,
    this.doctorType,
    this.biography,
    this.speciality,
    this.workTimeEnd,
    this.workTimeStart,
    this.yearExperience,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'imgUrl': imgUrl,
      'name': name,
      'doctorType': doctorType,
      'biography': biography,
      'speciality': speciality,
      'workTimeEnd': workTimeEnd,
      'workTimeStart': workTimeStart,
      'yearExperience': yearExperience,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  static Doctor fromMap(Map<String, dynamic> map) {
    return Doctor(
      biography: map['biography'],
      doctorType: map['doctorType'],
      imgUrl: map['imgUrl'],
      name: map['name'],
      speciality: map['speciality'],
      workTimeEnd: map['workTimeEnd'],
      workTimeStart: map['workTimeStart'],
      yearExperience: map['yearExperience'],
    );
  }
}

enum DoctorType {
  Specialist,
  Gp,
  Dentist,
  Therapist,
}

extension DoctorTypeExtension on DoctorType {
  String get name {
    switch (this) {
      case DoctorType.Dentist:
        return 'Dentist';
        break;
      case DoctorType.Gp:
        return 'GP';
        break;
      case DoctorType.Specialist:
        return 'Specialist';
        break;
      case DoctorType.Therapist:
        return 'Therapist';
        break;
      default:
    }
  }
}
