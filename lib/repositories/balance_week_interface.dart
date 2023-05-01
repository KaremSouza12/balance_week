import 'package:my_notes/models/balance_week.dart';

abstract class IBalanceWeek {
  Future<List<BalanceWeek>> getAll();
  Future<BalanceWeek?> getOne(int id);
  Future<void> insert(BalanceWeek balanceWeek);
  Future<void> update(BalanceWeek balanceWeek);
  Future<void> delete(int id);
}
