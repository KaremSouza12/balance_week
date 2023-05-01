import 'package:my_notes/datasource/data_base_actions.dart';
import 'package:my_notes/models/balance_week.dart';
import 'package:my_notes/repositories/balance_week_interface.dart';

class BalanceWeekRepository implements IBalanceWeek {
  BalanceWeekRepository({required this.actions});

  final DataBaseActions actions;

  @override
  Future<List<BalanceWeek>> getAll() async {
    final items = actions.getAllBalances();
    return items.map((item) => BalanceWeek.fromMap(items)).toList();
  }

  @override
  Future<BalanceWeek?> getOne(int id) async {
    final item = await actions.findOneItem(id);
    return item != null ? BalanceWeek.fromMap(item) : null;
  }

  @override
  Future<void> insert(BalanceWeek balanceWeek) async {
    await actions.createDta(balanceWeek);
  }

  @override
  Future<void> update(BalanceWeek balanceWeek) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
