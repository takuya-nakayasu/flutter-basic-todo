import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'pages/todo_list_page.dart';
import 'router/routes.dart';

void main() {
  // routerの設定
  final router = FluroRouter();
  Routes.configureRoutes(router);
  TodoApp.router = router;

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  static FluroRouter? router;

  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: TodoListPage());
    return MaterialApp(
        initialRoute: '/', onGenerateRoute: TodoApp.router?.generator);
  }
}
