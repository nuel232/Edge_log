import 'package:edge_log/data/local/app_database.dart';

class StrategyRepository {
  StrategyRepository(this._db);
  final AppDatabase _db;

  //READ: stream of all strategies for a user
  Stream<List<Strategy>> watchStrategies(String userId) {
    return (_db.select(
      _db.strategies,
    )..where((s) => s.userId.equals(userId))).watch();
  }

  Future<Strategy?> getStrategyById(String id) {
    return (_db.select(
      _db.strategies,
    )..where((s) => s.id.equals(id))).getSingleOrNull();
  }

  //CREATE
  Future<void> createStrategy(StrategiesCompanion strategy) {
    return _db.into(_db.strategies).insert(strategy);
  }

  //UPDATE
  Future<void> updateStrategy(StrategiesCompanion strategy) {
    return (_db.update(
      _db.strategies,
    )..where((s) => s.id.equals(strategy.id.value))).write(strategy);
  }

  //DELETE
  Future<void> deleteStrategy(String id) {
    return (_db.delete(_db.strategies)..where((s) => s.id.equals(id))).go();
  }
}
