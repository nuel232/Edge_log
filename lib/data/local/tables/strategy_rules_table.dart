import 'package:drift/drift.dart';
import 'package:edge_log/data/local/tables/strategies_table.dart';
import 'package:uuid/uuid.dart';

class StrategyRules extends Table {
  @override
  String get tableName => 'strategy_rules';

  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get strategyId => text().references(Strategies, #id)();
  TextColumn get ruleText => text().withLength(min: 1)();
  IntColumn get position => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
