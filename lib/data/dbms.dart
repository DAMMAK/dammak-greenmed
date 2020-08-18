import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/data/model.dart';
import 'package:doctorappointment/modules/visit_doctor/models/doctor.dart';
import 'package:doctorappointment/utils/string.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + AppConfig.DATABASE_NAME;
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

// SQL String to create User's table in the database
  static String _createUserTable =
      "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, password TEXT, phoneNumber TEXT)";

  // SQL String to create Doctor's table in the database
  static String _createDoctorTable =
      "CREATE TABLE doctors(id INTEGER PRIMARY KEY, name TEXT, speciality TEXT, imgUrl TEXT, doctorType INTEGER, biography TEXT, yearExperience INTEGER, workTimeStart STRING, workTimeEnd STRING)";

  static String _createAppointmentTable =
      "CREATE TABLE appointments(id INTEGER PRIMARY KEY, doctorID INTEGER, userID INTEGER, startTime TEXT, endTime TEXT)";

  static void onCreate(Database db, int version) async {
    await db.execute(_createUserTable);
    await db.execute(_createDoctorTable);
    await db.execute(_createAppointmentTable);

    await seed(db);
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, BaseModel model) async =>
      await _db.insert(table, model.toMap(), nullColumnHack: 'id');

  static Future<int> update(String table, BaseModel model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<List<Map<String, dynamic>>> find(
      String table, params, String where) async {
    return _db.query(table, whereArgs: params, where: where);
  }

  static Future<int> delete(String table, BaseModel model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}

seed(Database db) async {
  // await DB.init();
  Doctor doctor1 = Doctor(
    name: "Dr. Lily Aldrin",
    imgUrl: "doctor1.png",
    speciality: "Neurologist",
    doctorType: 1,
    yearExperience: 10,
    workTimeStart: "9:00",
    workTimeEnd: "17:00",
    biography:
        "Dr. Lily Aldrin was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  Doctor doctor2 = Doctor(
    name: "Dr. Ted Mosby",
    imgUrl: "doctor2.png",
    speciality: "Pediatrician",
    doctorType: 1,
    yearExperience: 7,
    workTimeStart: "9:00",
    workTimeEnd: "16:00",
    biography:
        "Dr. Ted Mosby Aldrin was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  Doctor doctor3 = Doctor(
    name: "Dr. Emma Lee",
    imgUrl: "doctor3.png",
    speciality: "Dermatologist",
    doctorType: 0,
    yearExperience: 5,
    workTimeStart: "9:00",
    workTimeEnd: "15:00",
    biography:
        "Dr. Emma Lee was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  Doctor doctor4 = Doctor(
    name: "Dr. Ross Tim",
    imgUrl: "doctor4.png",
    speciality: "Cardiologist",
    doctorType: 0,
    yearExperience: 8,
    workTimeStart: "8:00",
    workTimeEnd: "16:00",
    biography:
        "Dr. Ross Tim was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );

  Doctor doctor5 = Doctor(
    name: "Dr. Amy Joy",
    imgUrl: "doctor5.png",
    speciality: "Gynecologist",
    doctorType: 2,
    yearExperience: 3,
    workTimeStart: "8:00",
    workTimeEnd: "14:00",
    biography:
        "Dr. Amy Joy was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  Doctor doctor6 = Doctor(
    name: "Dr. Shaun Ray",
    imgUrl: "doctor6.png",
    speciality: "Pediatrician",
    doctorType: 2,
    yearExperience: 6,
    workTimeStart: "10:00",
    workTimeEnd: "17:00",
    biography:
        "Dr. Shaun Ray was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );

  Doctor doctor7 = Doctor(
    name: "Dr. Mark Don",
    imgUrl: "doctor7.png",
    speciality: "Gynecologist",
    doctorType: 3,
    yearExperience: 12,
    workTimeStart: "10:00",
    workTimeEnd: "17:00",
    biography:
        "Dr. Mark Down was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  Doctor doctor8 = Doctor(
    name: "Dr. Elon Musk",
    imgUrl: "doctor8.png",
    speciality: "Neurologist",
    doctorType: 3,
    yearExperience: 8,
    workTimeStart: "10:00",
    workTimeEnd: "17:00",
    biography:
        "Dr. Elon Musk was born on Jun 1982 in NYC. He went to NYO medical school to study medical science. He graduated in 2010 and started to work in some clinics. After 5 years he established 2 health clinics in NYC. According to parents reviews, most of the children like Dr. Mosby because he knows about child psychology and can communicate well with children.",
  );
  db.insert(Doctor.tablename, doctor1.toMap());
  db.insert(Doctor.tablename, doctor2.toMap());
  db.insert(Doctor.tablename, doctor3.toMap());
  db.insert(Doctor.tablename, doctor4.toMap());
  db.insert(Doctor.tablename, doctor5.toMap());
  db.insert(Doctor.tablename, doctor6.toMap());
  db.insert(Doctor.tablename, doctor7.toMap());
  db.insert(Doctor.tablename, doctor8.toMap());
}
