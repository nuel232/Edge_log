import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Pairs extends Table {
  @override
  String get tableName => 'pairs';

  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get symbol => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}
