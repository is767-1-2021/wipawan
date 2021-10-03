import 'package:flutter/foundation.dart';
import '/models/User.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [
    User(
        username: "ronnachia@tbs.tu.ac.th",
        name: "Ronnachia Jumsil",
        position: "Admin",
        password: "123456"),
    User(
        username: "panita@tbs.tu.ac.th",
        name: "Panita Tharaphoom",
        position: "Admin",
        password: "123456"),
    User(
        username: "orapan@tbs.tu.ac.th",
        name: "Orapan Talalaksana",
        position: "Doctor",
        password: "123456"),
    User(
        username: "ganokporn.m@tbs.tu.ac.th",
        name: "Ganokporn Maphundoong",
        position: "Doctor",
        password: "123456"),
    User(
        username: "chavisa.s@tbs.tu.ac.th",
        name: "Chavisa Santavanond",
        position: "Doctor",
        password: "123456"),
    User(
        username: "wipawan.v@tbs.tu.ac.th",
        name: "Chavisa Santavanond",
        position: "Doctor",
        password: "123456"),
  ];

  List<User> getUser() {
    return users;
  }

  void addUser(User statement) {
    users.add(statement);

    //users.insert(0, statement); เพิ่มด้านบน
    //users.add(statement); เพิ่มด้านล่าง
    notifyListeners();
// แจ้ง consumer
  }
}
