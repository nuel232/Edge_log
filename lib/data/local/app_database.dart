import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:edge_log/data/local/tables/accounts_table.dart';
import 'package:edge_log/data/local/tables/trades_table.dart';
import 'package:edge_log/data/local/tables/pairs_table.dart';
import 'package:edge_log/data/local/tables/sessions_table.dart';
import 'package:edge_log/data/local/tables/strategies_table.dart';
import 'package:edge_log/data/local/tables/strategy_rules_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Accounts, Trades, Pairs, Sessions, Strategies, StrategyRules],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'edge_log.db'));

  @override
  int get schemaVersion => 1;
}
