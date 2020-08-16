import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/data/model.dart';
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
      "CREATE TABLE doctors(id INTEGER PRIMARY KEY, name TEXT, specialization TEXT, fieldSpecialty TEXT, biography TEXT, experience INTEGER workTimeStart STRING, workTimeEnd STRING)";

  static void onCreate(Database db, int version) async {
    await db.execute(_createUserTable);
    await db.execute(_createDoctorTable);
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, BaseModel model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, BaseModel model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<List<Map<String, dynamic>>> find(
      String table, params, String where) async {
    return _db.query(table, whereArgs: params, where: where);
  }

  static Future<int> delete(String table, BaseModel model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}
