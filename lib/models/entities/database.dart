import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName("ToDoEntity")
class ToDoEntities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get todo => text().withLength(min: 1, max: 32)();
  DateTimeColumn get created => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [ToDoEntities])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnecrion());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnecrion() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo.db'));
    return VmDatabase(file);
  });
}
