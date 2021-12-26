import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/main.dart';
import 'package:flutter_basic_todo/model/todo.dart';

class AccountPage extends StatelessWidget {
  final String username;
  const AccountPage(this.username, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: Center(
        child: Text('Welcome home, $username!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings_backup_restore),
        onPressed: () {
          TodoApp.router?.navigateTo(
            context,
            '/detail',
            routeSettings: RouteSettings(
              arguments: Todo('todo-101', 'ゴミ出し'),
            ),
          );
        },
      ),
    );
  }
}
