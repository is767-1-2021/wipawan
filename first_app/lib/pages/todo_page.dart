import 'package:first_app/controller/todo.dart';
import 'package:first_app/models/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  TodoPage({required this.controller});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fecthTodos();

    setState(() {
      todos = newTodos;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text('Tap button to fech Todos');
            }

            return CheckboxListTile(
              value: todos[index].completed,
              onChanged: null,
              title: Text(todos[index].title),
            );
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}
