import 'package:flutter_app_moor/models/entities/database.dart';
import 'package:moor/moor.dart';

part 'dao.g.dart';

@UseDao(tables: [ToDoEntities])
class ToDoDao extends DatabaseAccessor<AppDatabase> with _$ToDoDaoMixin {
  ToDoDao(AppDatabase db) : super(db);

  //全削除
  Future clearAll() => delete(toDoEntities).go();

  //該当のデータ削除
  Future clearById(ToDoEntity todo) =>
      (delete(toDoEntities)..where((m) => m.id.equals(todo.id))).go();

  //登録
  Future insert(ToDoEntity todo) async {
    await into(toDoEntities).insert(todo);
  }

  //読み出し（登録日の降順）
  Future<List<ToDoEntity>> get findAllOrderByCreated => (select(toDoEntities)
        ..orderBy([
          (m) => OrderingTerm(expression: m.created, mode: OrderingMode.desc)
        ]))
      .get();
}
