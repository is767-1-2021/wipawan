import 'dart:async';

import 'package:icovid/models/user_model.dart';
import 'package:icovid/services/user_service.dart';

class UserController {
  final UserServices services;
  List<User> users = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  UserController(this.services);

  Future<List<User>> fecthUsers() async {
    onSyncController.add(true);
    users = await services.getUsers();
    onSyncController.add(false);
    return users;
  }

  void addUser(User items) async {
    services.addUser(items);
  }
}
