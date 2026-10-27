import 'package:drift/drift.dart';
import 'package:edge_log/data/local/app_database.dart';

class StrategyRulesRepository {
  StrategyRulesRepository(this._db);
  final AppDatabase _db;

  // READ: stream of all rules for a strategy, ordered by position
  Stream<List<StrategyRule>> watchRules(String strategyId) {
    return (_db.select(_db.strategyRules)
          ..where((r) => r.strategyId.equals(strategyId))
          ..orderBy([(r) => OrderingTerm.asc(r.position)]))
        .watch();
  }

  // CREATE
  Future<void> insertRule(StrategyRulesCompanion rule) {
    return _db.into(_db.strategyRules).insert(rule);
  }

  // UPDATE
  Future<void> updateRule(StrategyRulesCompanion rule) {
    return (_db.update(
      _db.strategyRules,
    )..where((r) => r.id.equals(rule.id.value))).write(rule);
  }

  // UPDATE positions when user reorders rules
  Future<void> updatePosition(String id, int newPosition) {
    return (_db.update(_db.strategyRules)..where((r) => r.id.equals(id))).write(
      StrategyRulesCompanion(position: Value(newPosition)),
    );
  }

  // DELETE
  Future<void> deleteRule(String id) {
    return (_db.delete(_db.strategyRules)..where((r) => r.id.equals(id))).go();
  }
}
