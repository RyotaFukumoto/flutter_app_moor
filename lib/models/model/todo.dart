import 'package:intl/intl.dart';

class Todo {
  final int id;
  final String todo;
  final DateTime created;

  const Todo({this.id, this.todo, this.created});
}

extension ToDoToString on DateTime {
  String toStringCreated(DateTime created) {
    return DateFormat('yyyy-MM-dd hh:mm').format(created);
  }
}
