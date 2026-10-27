import 'package:edge_log/data/local/app_database.dart';
import 'package:edge_log/data/providers/database_providers.dart';
import 'package:edge_log/data/providers/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tradesProvider = StreamProvider<List<Trade>>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  final repository = ref.watch(tradeRepositoryProvider);
  return repository.watchTrades(userId);
});
