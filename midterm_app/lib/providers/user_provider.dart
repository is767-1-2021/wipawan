import 'package:flutter/foundation.dart';
import '/models/User.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [
    User(
        username: "ronnachia@gmail.com",
        name: "Ronnachia Jumsil",
        position: "Admin",
        password: "123456"),
    User(
        username: "panita.t@gmail.com",
        name: "Panita Tharaphoom",
        position: "Admin",
        password: "123456"),
    User(
        username: "orapan.t@gmail.com",
        name: "Orapan Talalaksana",
        position: "Lab",
        password: "123456"),
    User(
        username: "ganokporn.m@gmail.com",
        name: "Ganokporn Maphundoong",
        position: "Doctor",
        password: "123456"),
    User(
        username: "chavisa.s@gmail.com",
        name: "Chavisa Santavanond",
        position: "Doctor",
        password: "123456"),
    User(
        username: "wipawan.v@gmail.com",
        name: "Wipawan Vattanakiettipong",
        position: "Admin",
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
