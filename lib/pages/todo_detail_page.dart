import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/model/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage(this.todo, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: Center(
        child: Text('Welcome home, ${todo.id} ${todo.title}!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings_backup_restore),
        onPressed: () {},
      ),
    );
  }
}
