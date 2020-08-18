import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/data/model.dart';

class Appointment extends BaseModel {
  static String tablename = AppConfig.APPOINTMENT_TABLE_NAME;

  int id;
  int doctorID;
  int userID;
  String startTime;
  String endTime;
  Appointment({
    this.doctorID,
    this.endTime,
    this.id,
    this.startTime,
    this.userID,
  });
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'doctorID': doctorID,
      'userID': userID,
      'startTime': startTime,
      'endTime': endTime,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  static Appointment fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map["id"],
      doctorID: map["doctorID"],
      endTime: map["endTime"],
      startTime: map["startTime"],
      userID: map["userID"],
    );
  }
}
