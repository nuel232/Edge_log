import 'package:edge_log/data/local/app_database.dart';

class AccountRepository {
  AccountRepository(this._db);
  final AppDatabase _db;

  //READ: stream of all accounts for a user
  Stream<List<Account>> watchAccounts(String userId) {
    return (_db.select(
      _db.accounts,
    )..where((a) => a.userId.equals(userId))).watch();
  }

  //Read: get single account
  Future<Account?> getAccountById(String id) {
    return (_db.select(
      _db.accounts,
    )..where((a) => a.id.equals(id))).getSingleOrNull();
  }

  //CREATE
  Future<void> createAccount(AccountsCompanion account) {
    return _db.into(_db.accounts).insert(account);
  }

  //UPDATE
  Future<void> updateAccount(AccountsCompanion account) {
    return (_db.update(
      _db.accounts,
    )..where((a) => a.id.equals(account.id.value))).write(account);
  }

  //DELETE
  Future<void> deleteAccount(String id) {
    return (_db.delete(_db.accounts)..where((a) => a.id.equals(id))).go();
  }
}
