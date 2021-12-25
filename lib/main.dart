import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'router/routes.dart';

void main() {
  // FluroRouterオブジェクトの初期化
  final router = FluroRouter();
  // ルーディングの設定
  Routes.configureRoutes(router);
  // 他のWidgetからも呼び出せるようにFluroRouterオブジェクトをrouterプロパティに設定
  TodoApp.router = router;

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  static FluroRouter? router;

  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: TodoListPage());
    // 最初のrouteを「/」に設定
    // FluroRouterのgeneratorをonGenerateRouteに設定
    return MaterialApp(
        initialRoute: '/', onGenerateRoute: TodoApp.router?.generator);
  }
}
