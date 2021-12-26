import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/model/todo.dart';
import 'package:flutter_basic_todo/pages/account_page.dart';
import 'package:flutter_basic_todo/pages/add_todo_page.dart';
import 'package:flutter_basic_todo/pages/todo_detail_page.dart';
import 'package:flutter_basic_todo/pages/todo_list_page.dart';

/// ハンドラー作成
Handler createBasicHandler(Widget targetWidget) {
  return Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return targetWidget;
  });
}

Handler accountPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return AccountPage(params['userName']!.first);
});

Handler todoDetailPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final args = context?.settings?.arguments as Todo;
  return TodoDetailPage(args);
});

class Routes {
  // Route設定
  static void configureRoutes(FluroRouter router) {
    router
      ..define('/', handler: createBasicHandler(const TodoListPage()))
      ..define('/add', handler: createBasicHandler(const AddTodoPage()))
      ..define('/account/:userName', handler: accountPageHandler)
      ..define('/detail', handler: todoDetailPageHandler);
  }
}
