import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Accounts extends Table {
  @override
  String get tableName => 'accounts';

  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  Int64Column get startingBalance =>
      int64().withDefault(Constant(BigInt.zero))();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  IntColumn get profitTarget => integer().withDefault(const Constant(0))();
  IntColumn get maxDrawdown => integer().withDefault(const Constant(0))();
  IntColumn get totalPhases => integer().withDefault(const Constant(2))();
  IntColumn get currentPhase => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
