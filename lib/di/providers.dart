import 'package:flutter_app_moor/models/dbs/dao.dart';
import 'package:flutter_app_moor/models/entities/database.dart';
import 'package:flutter_app_moor/models/repositories/todo_repository.dart';
import 'package:flutter_app_moor/viewmodels/todo_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [
  Provider<AppDatabase>(
    create: (_) => AppDatabase(),
    dispose: (_, db) => db.close(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<AppDatabase, ToDoDao>(
    update: (context, db, dao) => ToDoDao(db),
  ),
  ChangeNotifierProvider<ToDoRepository>(
    create: (context) =>
        ToDoRepository(dao: Provider.of<ToDoDao>(context, listen: false)),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProxyProvider<ToDoRepository, ToDoViewModel>(
    create: (context) => ToDoViewModel(
      repository: Provider.of<ToDoRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
        viewModel..onRepositoryUpdated(repository),
  )
];
