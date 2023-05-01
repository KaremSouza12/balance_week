import 'package:my_notes/datasource/data_base.dart';
import 'package:sqflite/sqflite.dart';

import '../models/balance_week.dart';

class DataBaseActions {
  List<BalanceWeek> _items = [];

  getAllBalances() async {
    final db = await DB.instance.database;

    final List<Map<String, dynamic>> data = await db.query('balance_week');

    _items = List.generate(data.length, (i) {
      return BalanceWeek(
        id: data[i]['id'],
        nameDayWeek: data[i]['nameDayWeek'],
        dateOfDayWeek: data[i]['dateOfDayWeek'],
        totalWeek: data[i]['totalWeek'],
        valueOfDayWeek: data[i]['valueOfDayWeek'],
      );
    });
    return _items;
  }

  findOneItem(int? id) async {
    final db = await DB.instance.database;
    final info = await db.query('balance_week', where: "id=?", whereArgs: [id]);
    if (info.isNotEmpty) {
      return BalanceWeek.fromMap(info.first);
    }

    return null;
  }

  createDta(BalanceWeek balanceWeek) async {
    final db = DB.instance.database;

    await db.insert(
      'balance_week',
      balanceWeek.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    getAllBalances();
  }
}
