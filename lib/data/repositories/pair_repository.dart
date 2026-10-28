import 'package:edge_log/data/local/app_database.dart';

class PairRepository {
  PairRepository(this._db);
  final AppDatabase _db;

  //READ: stream of all pairs for a user
  Stream<List<Pair>> watchPairs(String userId) {
    return (_db.select(
      _db.pairs,
    )..where((p) => p.userId.equals(userId))).watch();
  }

  //READ: get single pair
  Future<Pair?> getPairById(String id) {
    return (_db.select(
      _db.pairs,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  //CREATE
  Future<void> createPair(PairsCompanion pair) {
    return _db.into(_db.pairs).insert(pair);
  }

  //UPDATE
  Future<void> updatePair(PairsCompanion pair) {
    return (_db.update(
      _db.pairs,
    )..where((p) => p.id.equals(pair.id.value))).write(pair);
  }

  //DELETE
  Future<void> deletePair(String id) {
    return (_db.delete(_db.pairs)..where((p) => p.id.equals(id))).go();
  }
}
