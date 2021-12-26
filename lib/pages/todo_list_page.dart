import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/main.dart';

import 'add_todo_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Todos")),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final newListText = await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => const AddTodoPage(),
          //   ),
          // );
          final newListText = await TodoApp.router?.navigateTo(context, '/add',
              transition: TransitionType.material);
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
