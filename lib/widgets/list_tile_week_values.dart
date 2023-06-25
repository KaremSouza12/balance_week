import 'package:flutter/material.dart';
import 'package:my_notes/models/balance_week.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';

class ListTileWeekValues extends StatefulWidget {
  const ListTileWeekValues({
    required this.balance,
    required this.repository,
    required this.id,
    super.key,
  });

  final BalanceWeek balance;
  final BalanceWeekRepository repository;
  final int? id;

  @override
  State<ListTileWeekValues> createState() => _ListTileWeekValuesState();
}

class _ListTileWeekValuesState extends State<ListTileWeekValues> {
  Future<void> _showForm(
    BuildContext context,
    BalanceWeekRepository repository,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        // return UpdateForm(nameDayWeek: null,);
        return SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          widget.balance.nameDayWeek as String,
          style: const TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          widget.balance.dateOfDayWeek as String,
          style: const TextStyle(fontSize: 17),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.balance.valueOfDayWeek.toString(),
                style: const TextStyle(fontSize: 17),
              ),
              IconButton(
                onPressed: () => _showForm(context, widget.repository),
                icon: const Icon(Icons.update),
              ),
              SizedBox(
                width: 20,
                child: IconButton(
                  onPressed: () {
                    widget.repository.deleteData(widget.id);
                  },
                  icon: const Icon(Icons.delete_forever),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
