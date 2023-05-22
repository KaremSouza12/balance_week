import 'package:flutter/material.dart';
import 'package:my_notes/repositories/balance_week_repository.dart';
import 'package:my_notes/widgets/list_tile_week_values.dart';
import 'package:provider/provider.dart';

class ListValuesWeek extends StatelessWidget {
  const ListValuesWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<BalanceWeekRepository>();

    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: repository.balanceWeek.length,
        itemBuilder: (_, index) {
          final balance = repository.balanceWeek[index];
          final len = repository.balanceWeek.length;
          return ListTileWeekValues(
            balance: balance,
          );
        },
      ),
    );
  }
}
