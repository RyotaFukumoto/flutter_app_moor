import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_moor/models/model/todo.dart';
import 'package:flutter_app_moor/viewmodels/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class AddToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('addToDo'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: Text('save'),
          onPressed: () {
            Navigator.pop<String>(context, 'test');
            _addToDo(context);
          },
        ),
      ),
    );
  }

  _addToDo(BuildContext context) {
    final ToDoViewModel viewModel =
        Provider.of<ToDoViewModel>(context, listen: false);
    var todo = Todo(todo: "title", created: DateTime.now());

    viewModel.addToDo(todo);
    _loadToDos(context);
  }

  void _loadToDos(BuildContext context) {
    final ToDoViewModel viewModel =
        Provider.of<ToDoViewModel>(context, listen: false);
    Future(() => viewModel.getToDos());
  }
}
