import 'package:flutter/material.dart';
import 'package:flutter_app_moor/models/dbs/dao.dart';
import 'package:flutter_app_moor/models/entities/database.dart';
import 'package:flutter_app_moor/models/model/todo.dart';
import 'package:flutter_app_moor/models/utils/todo_extensions.dart';

class ToDoRepository extends ChangeNotifier {
  final ToDoDao _dao;

  ToDoRepository({dao}) : _dao = dao;

  List<Todo> _todos = List<Todo>();
  List<Todo> get todos => _todos;

  getTodos() async {
    List<ToDoEntity> result = await _dao.findAllOrderByCreated;
    _todos = result.toToDos(result);
    notifyListeners();
  }

  Future<int> addToDo(ToDoEntity todo) async {
    return await _dao.insert(todo);
  }

  Future<void> removeToDo(ToDoEntity todo) async {
    return await _dao.clearById(todo);
  }
}
