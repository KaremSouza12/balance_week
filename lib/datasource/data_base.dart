import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDataBase();
  }

  _initDataBase() async {
    return openDatabase(
        join(
          await getDatabasesPath(),
          'balance',
        ),
        onCreate: _onCreate,
        version: 1);
  }

  _onCreate(db, version) {
    return db.execute(balenceWeek);
  }

  String get balenceWeek =>
      '''CREATE TABLE balance (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nameDayWeek TEXT, dateOfDayWeek TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, totalWeek REAL, valueOfDayWeek REAL )''';
}
