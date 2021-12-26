import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/model/todo.dart';
import 'package:flutter_basic_todo/pages/account_page.dart';
import 'package:flutter_basic_todo/pages/add_todo_page.dart';
import 'package:flutter_basic_todo/pages/todo_detail_page.dart';
import 'package:flutter_basic_todo/pages/todo_list_page.dart';

// 遷移先に渡したい値がない時に使用するハンドラー
// 単に引数で設定した遷移先の画面を返すだけのハンドラーになっている
Handler createBasicHandler(Widget targetWidget) {
  return Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return targetWidget;
  });
}

// アカウント画面に遷移する時に呼び出されるハンドラー
// パスに設定したuserNameパラメーターを遷移先の画面に渡している
Handler accountPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return AccountPage(params['userName']!.first);
});

// Todo詳細画面に遷移する時に呼び出されるハンドラー
// Todoオブジェクトを遷移先の画面に渡している
Handler todoDetailPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final args = context?.settings?.arguments as Todo;
  return TodoDetailPage(args);
});

class Routes {
  // routeと遷移先の画面、遷移時に呼び出されるハンドラーを設定している
  static void configureRoutes(FluroRouter router) {
    router
      // 最初に遷移する画面、route: '/'でTodoリスト画面に遷移する
      ..define('/', handler: createBasicHandler(const TodoListPage()))
      // route: '/add'でTodo追加画面に遷移するように設定している
      ..define('/add', handler: createBasicHandler(const AddTodoPage()))
      // route: '/account/:userName'でアカウント画面に遷移する
      // ':userName'パラメーターでユーザー名を遷移先の画面に渡している
      ..define('/account/:userName', handler: accountPageHandler)
      // route: '/detail'でTodo詳細画面に遷移する
      // Todoオブジェクトを遷移先の画面に渡している
      ..define('/detail', handler: todoDetailPageHandler);
  }
}
