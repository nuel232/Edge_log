import 'package:edge_log/data/local/app_database.dart';
import 'package:edge_log/data/repositories/account_repository.dart';
import 'package:edge_log/data/repositories/pair_repository.dart';
import 'package:edge_log/data/repositories/session_repository.dart';
import 'package:edge_log/data/repositories/strategy_repository.dart';
import 'package:edge_log/data/repositories/strategy_rules_repository.dart';
import 'package:edge_log/data/repositories/trade_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(ref.watch(databaseProvider));
});

final tradeRepositoryProvider = Provider<TradeRepository>((ref) {
  return TradeRepository(ref.watch(databaseProvider));
});

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository(ref.watch(databaseProvider));
});

final pairRepositoryProvider = Provider<PairRepository>((ref) {
  return PairRepository(ref.watch(databaseProvider));
});

final strategyRepositoryProvider = Provider<StrategyRepository>((ref) {
  return StrategyRepository(ref.watch(databaseProvider));
});

final strategyRulesRepositoryProvider = Provider<StrategyRulesRepository>((
  ref,
) {
  return StrategyRulesRepository(ref.watch(databaseProvider));
});
