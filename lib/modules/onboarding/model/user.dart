import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/data/model.dart';

class User extends BaseModel {
  static String tablename = AppConfig.USER_TABLE_NAME;
  int id;
  String name;
  String phoneNumber;
  String password;

  User({this.name, this.id, this.password, this.phoneNumber});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'phoneNumber': phoneNumber,
      'password': password,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      password: map['password'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
