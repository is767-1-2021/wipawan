import 'dart:async';

import 'package:first_app/models/todo.dart';
import 'package:first_app/services/services.dart';

class TodoController {
  //final HttpServices services;
  final Services services;
  List<Todo> todos = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.services);

  Future<List<Todo>> fecthTodos() async {
    onSyncController.add(true);
    todos = await services.getTodos();
    onSyncController.add(false);
    return todos;
  }
}
