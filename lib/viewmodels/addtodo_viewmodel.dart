import 'package:flutter/cupertino.dart';
import 'package:flutter_app_moor/models/model/todo.dart';
import 'package:flutter_app_moor/models/repositories/todo_repository.dart';
import 'package:flutter_app_moor/models/utils/todo_extensions.dart';

class AddToDoViewModel extends ChangeNotifier {
  final ToDoRepository _repository;

  AddToDoViewModel({repository}) : _repository = repository;

  List<Todo> _todos = List<Todo>();

  List<Todo> get todos => _todos;

  Future<void> getToDos() async {
    await _repository.getTodos();
  }

  Future<void> addToDo(Todo todo) async {
    await _repository.addToDo(todo.toToDoEntity(todo));
  }

  Future<void> removeToDo(Todo todo) async {
    await _repository.removeToDo(todo.toToDoEntity(todo));
  }

  @override
  void dispose() {
    super.dispose();
  }

  onRepositoryUpdated(ToDoRepository repository) {
    _todos = repository.todos;
    notifyListeners();
  }
}
