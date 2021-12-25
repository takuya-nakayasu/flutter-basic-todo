import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/pages/add_todo_page.dart';
import 'package:flutter_basic_todo/pages/todo_list_page.dart';

/// ハンドラー作成
Handler createSimpleHandler(Widget targetWidget) {
  return Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return targetWidget;
  });
}

class Routes {
  // Route設定
  static void configureRoutes(FluroRouter router) {
    router
      ..define('/', handler: createSimpleHandler(TodoListPage()))
      ..define('/add', handler: createSimpleHandler(AddTodoPage()));
  }
}
