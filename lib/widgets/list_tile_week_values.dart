import 'package:flutter/material.dart';
import 'package:my_notes/models/balance_week.dart';

class ListTileWeekValues extends StatelessWidget {
  const ListTileWeekValues({
    super.key,
    required this.balance,
  });

  final BalanceWeek balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          balance.nameDayWeek as String,
          style: const TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          balance.dateOfDayWeek as String,
          style: const TextStyle(fontSize: 17),
        ),
        trailing: SizedBox(
          width: 100,
          child: Text(
            balance.valueOfDayWeek.toString(),
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
