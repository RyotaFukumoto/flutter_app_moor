import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_moor/models/model/todo.dart';
import 'package:flutter_app_moor/viewmodels/todo_viewmodel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    _loadToDos();

    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      body: Container(
        color: Colors.white,
        child: Consumer<ToDoViewModel>(
          builder: (context, model, child) {
            return ListView.builder(
                itemCount: model.todos.length,
                itemBuilder: (context, int position) => Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(model.todos[position].todo),
                          subtitle: Text(model.todos[position].created
                              .toStringCreated(model.todos[position].created)),
                        ),
                      ),
                      actions: [
                        IconSlideAction(
                          caption: '削除',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            _remove(model.todos[position]);
                          },
                        )
                      ],
                    ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var massege = await Navigator.pushNamed(context, '/addTodo');
          print(massege);
        },
      ),
    );
  }

  void _loadToDos() {
    final ToDoViewModel viewModel =
        Provider.of<ToDoViewModel>(context, listen: false);
    Future(() => viewModel.getToDos());
  }

  _addToDo() {
    final ToDoViewModel viewModel =
        Provider.of<ToDoViewModel>(context, listen: false);
    var todo = Todo(todo: "title", created: DateTime.now());

    viewModel.addToDo(todo);
    _loadToDos();
  }

  _remove(Todo todo) {
    final ToDoViewModel viewModel =
        Provider.of<ToDoViewModel>(context, listen: false);

    viewModel.removeToDo(todo);
    _loadToDos();
  }
}
