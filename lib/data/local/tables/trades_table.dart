import 'package:drift/drift.dart';
import 'package:edge_log/data/local/tables/accounts_table.dart';
import 'package:edge_log/data/local/tables/pairs_table.dart';
import 'package:edge_log/data/local/tables/sessions_table.dart';
import 'package:edge_log/data/local/tables/strategies_table.dart';
import 'package:uuid/uuid.dart';

class Trades extends Table {
  @override
  String get tableName => 'trades';

  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get accountId => text().references(Accounts, #id)();
  TextColumn get pairId => text().references(Pairs, #id)();
  TextColumn get sessionId => text().references(Sessions, #id)();
  TextColumn get strategyId => text().nullable().references(Strategies, #id)();
  TextColumn get direction => text().withLength(min: 1, max: 10)();
  Int64Column get riskAmount => int64().withDefault(Constant(BigInt.zero))();
  Int64Column get pnl => int64().withDefault(Constant(BigInt.zero))();
  DateTimeColumn get entryTime => dateTime()();
  DateTimeColumn get exitTime => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get beforeImage => text().nullable()();
  TextColumn get afterImage => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
