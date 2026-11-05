import 'package:drift/drift.dart';
import 'package:edge_log/data/local/app_database.dart';

class SeedService {
  final AppDatabase _db;
  SeedService(this._db);

  Future<void> seedIfNeeded(String userId) async {
    // Check if the user already has sessions or pairs

    final count = await (_db.select(
      _db.sessions,
    )..where((s) => s.userId.equals(userId))).get();
    if (count.isNotEmpty) return;

    // Seed Data

    final sessionSeeds = [
      SessionsCompanion(userId: Value(userId), name: Value('Asia')),
      SessionsCompanion(userId: Value(userId), name: Value('London')),
      SessionsCompanion(userId: Value(userId), name: Value('New York')),
    ];

    final pairSeeds = [
      PairsCompanion(userId: Value(userId), symbol: Value('XAUUSD')),
      PairsCompanion(userId: Value(userId), symbol: Value('EURUSD')),
      PairsCompanion(userId: Value(userId), symbol: Value('GBPUSD')),
      PairsCompanion(userId: Value(userId), symbol: Value('USDJPY')),
      PairsCompanion(userId: Value(userId), symbol: Value('GBPJPY')),
      PairsCompanion(userId: Value(userId), symbol: Value('USDCHF')),
      PairsCompanion(userId: Value(userId), symbol: Value('AUDUSD')),
      PairsCompanion(userId: Value(userId), symbol: Value('USDCAD')),
      PairsCompanion(userId: Value(userId), symbol: Value('BTCUSD')),
      PairsCompanion(userId: Value(userId), symbol: Value('ETHUSD')),
    ];

    //transaction

    await _db.batch((batch) {
      batch.insertAll(_db.sessions, sessionSeeds);
      batch.insertAll(_db.pairs, pairSeeds);
    });
  }
}
