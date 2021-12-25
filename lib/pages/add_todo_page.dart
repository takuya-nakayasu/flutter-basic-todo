import 'package:flutter/material.dart';

import '../main.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new todo')),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context, _text);
                  TodoApp.router?.pop(context, _text);
                },
                child: Text(
                  'リスト追加',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('キャンセル')))
          ],
        ),
      ),
    );
  }
}
