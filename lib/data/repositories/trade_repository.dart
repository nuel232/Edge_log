import 'package:drift/drift.dart';
import 'package:edge_log/data/local/app_database.dart';

class TradeRepository {
  TradeRepository(this._db);
  final AppDatabase _db;

  //Read: stream of all trades for a user
  Stream<List<Trade>> watchTrades(String userId) {
    return (_db.select(_db.trades)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.desc(t.entryTime)]))
        .watch();
  }

  //READE: GET single trade
  Future<Trade?> getTradeById(String id) {
    return (_db.select(
      _db.trades,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  //CREATE
  Future<void> createTrade(TradesCompanion trade) {
    return (_db.into(_db.trades).insert(trade));
  }

  //UPDATE
  Future<void> updateTrade(TradesCompanion trade) {
    return (_db.update(_db.trades)..where((t) => t.id.equals(trade.id.value)))
        .write(trade.copyWith(updatedAt: Value(DateTime.now())));
  }

  //DELETE
  Future<void> deleteTrade(String id) {
    return (_db.delete(_db.trades)..where((t) => t.id.equals(id))).go();
  }
}
