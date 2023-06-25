import 'package:flutter/material.dart';
import 'package:my_notes/datasource/data_base.dart';
import 'package:sqflite/sqflite.dart';

import '../models/balance_week.dart';

class BalanceWeekRepository extends ChangeNotifier {
  late Database db;
  List<BalanceWeek> _balanceWeek = [];

  List<BalanceWeek> get balanceWeek => _balanceWeek;

  BalanceWeekRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getAllBalances();
  }

  _getAllBalances() async {
    db = await DB.instance.database;
    final List<Map<String, dynamic>> data = await db.query(
      'balance',
    );

    _balanceWeek = List.generate(
      data.length,
      (i) {
        return BalanceWeek(
            id: data[i]['id'],
            nameDayWeek: data[i]['nameDayWeek'],
            dateOfDayWeek: data[i]['dateOfDayWeek'],
            totalday: data[i]['totalday'],
            valueOfDayWeek: data[i]['valueOfDayWeek'],
            hourOfDayWeek: data[i]['hourOfDayWeek']);
      },
    );
    print(_balanceWeek);
    notifyListeners();
  }

  getDaysWeek() async {
    db = await DB.instance.database;
    var now = new DateTime.now();
    var now_1w = now.subtract(Duration(days: 7));
    final data = await db
        .query('balance', where: "dateOfDayWeek=?", whereArgs: [now_1w]);

    print(data.toString());
  }

  findOneItem(int? id) async {
    db = await DB.instance.database;
    final info = await db.query('balance', where: "id=?", whereArgs: [id]);
    if (info.isNotEmpty) {
      return BalanceWeek.fromMap(info.first);
    }

    return null;
  }

  createData(BalanceWeek balanceWeek) async {
    db = await DB.instance.database;

    final id = await db.insert(
      'balance',
      balanceWeek.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _getAllBalances();
    notifyListeners();
    return id;
  }

  deleteData(int? id) async {
    db = await DB.instance.database;
    await db.delete('balance', where: 'id = ?', whereArgs: [id]);
    db.close();
    _getAllBalances();
    notifyListeners();
  }

  getItem(int? id) async {
    final db = await DB.instance.database;
    final info = await db.query('balance', where: "id=?", whereArgs: [id]);
    if (info.isNotEmpty) {
      return BalanceWeek.fromMap(info.first);
    }

    return null;
  }

  updateValues(
    int? id,
    String? nameDayWeek,
    String? dateOfDayWeek,
    double? totalday,
    double? valueOfDayWeek,
    String? hourOfDayWeek,
  ) async {
    final db = await DB.instance.database;

    final account = BalanceWeek(
      nameDayWeek: nameDayWeek,
      dateOfDayWeek: dateOfDayWeek,
      totalday: totalday,
      valueOfDayWeek: valueOfDayWeek,
      hourOfDayWeek: hourOfDayWeek,
    );
    db.update('balance', account.toMap(), where: 'id=?', whereArgs: [id]);
    db.close();
    notifyListeners();
    _getAllBalances();
  }
}
