import 'package:flutter/foundation.dart';
import '/models/User.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [
    User(
        username: "Ronnachia.R",
        name: "Ronnachia Jumsil",
        position: "Admin",
        password: "1234"),
    User(
        username: "Panita.T",
        name: "Panita Tharaphoom",
        position: "Admin",
        password: "1234"),
    User(
        username: "Orapan.BN",
        name: "Orapan Talalaksana",
        position: "Doctor",
        password: "1234"),
    User(
        username: "Ganokporn.M",
        name: "Ganokporn Maphundoong",
        position: "Doctor",
        password: "1234"),
    User(
        username: "Chavisa.CN",
        name: "Chavisa Santavanond",
        position: "Doctor",
        password: "1234"),
  ];

  List<User> getUser() {
    return users;
  }

  void addUser(User statement) {
    users.insert(0, statement);

    //users.insert(0, statement); เพิ่มด้านบน
    //users.add(statement); เพิ่มด้านล่าง
    notifyListeners();
// แจ้ง consumer
  }
}
