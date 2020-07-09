import 'package:flutter/material.dart';
import 'package:flutter_app_moor/views/pages/addtodo_page.dart';
import 'package:flutter_app_moor/views/pages/myhome_page.dart';

import 'package:provider/provider.dart';

import 'di/providers.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/addTodo": (context) => AddToDoPage()},
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
