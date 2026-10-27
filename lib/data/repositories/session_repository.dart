import 'package:edge_log/data/local/app_database.dart';

class SessionRepository {
  SessionRepository(this._db);
  final AppDatabase _db;

  //READ: stream of all sessions for a user
  Stream<List<Session>> watchSessions(String userId) {
    return (_db.select(
      _db.sessions,
    )..where((s) => s.userId.equals(userId))).watch();
  }

  //READ: get single session
  Future<Session?> getSessionById(String id) {
    return (_db.select(
      _db.sessions,
    )..where((s) => s.id.equals(id))).getSingleOrNull();
  }

  //CREATE
  Future<void> createSession(SessionsCompanion session) {
    return _db.into(_db.sessions).insert(session);
  }

  //UPDATE
  Future<void> updateSession(SessionsCompanion session) {
    return (_db.update(
      _db.sessions,
    )..where((s) => s.id.equals(session.id.value))).write(session);
  }

  //DELETE
  Future<void> deleteSession(String id) {
    return (_db.delete(_db.sessions)..where((s) => s.id.equals(id))).go();
  }
}
