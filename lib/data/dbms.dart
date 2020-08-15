import 'package:doctorappointment/utils/string.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDB {
  void init() async {
    final Future<Database> database =
        openDatabase(join(await getDatabasesPath(), AppString.DATABASE_NAME),
            onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      db.execute(_createUserTable());
      db.execute(_createDoctorTable());
    });
  }

// SQL String to create User's table in the database
  String _createUserTable() =>
      "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, password TEXT, phone TEXT)";

  // SQL String to create Doctor's table in the database
  String _createDoctorTable() =>
      "CREATE TABLE doctors(id INTEGER PRIMARY KEY, name TEXT, specialization TEXT, field TEXT, biography TEXT, experience INTEGER workTimeStart STRING, workTimeEnd STRING)";
}
