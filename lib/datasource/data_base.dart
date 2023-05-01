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
          'balance_week',
        ),
        onCreate: _onCreate,
        version: 1);
  }

  _onCreate(db, version) {
    return db.execute(balenceWeek);
  }

  String get balenceWeek => '''CREATE TABLE balance_week (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   name_day_week TEXT, date_of_day_week TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
   total_week REALL, 
    value_of_day_week REAL 
   )''';
}
