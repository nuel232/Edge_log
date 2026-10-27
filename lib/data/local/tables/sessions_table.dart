import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Sessions extends Table {
  @override
  String get tableName => 'sessions';

  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}
