import 'package:flutter_app_moor/models/entities/database.dart';
import 'package:flutter_app_moor/models/model/todo.dart';

extension ConvertToToDoEntities on List<Todo> {
  List<ToDoEntity> toToDoEntities(List<Todo> todos) {
    var todoEntities = List<ToDoEntity>();

    todos.forEach((todo) {
      todoEntities.add(ToDoEntity(
          id: todo.id, todo: todo.todo ?? "", created: todo.created));
    });
    return todoEntities;
  }
}

extension ConvertToToDoEntity on Todo {
  ToDoEntity toToDoEntity(Todo todo) {
    var todoEntity = ToDoEntity(
      id: todo.id,
      todo: todo.todo ?? "",
      created: todo.created,
    );
    return todoEntity;
  }
}

extension ConvertToToDos on List<ToDoEntity> {
  List<Todo> toToDos(List<ToDoEntity> todoEntities) {
    var todos = List<Todo>();

    todoEntities.forEach((todo) {
      todos.add(Todo(
          id: todo.id ?? "",
          todo: todo.todo ?? "",
          created: todo.created ?? ""));
    });
    return todos;
  }
}
