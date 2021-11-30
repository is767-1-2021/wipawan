import 'package:flutter/foundation.dart';
import '/models/User.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [
    User(
        username: "รายรับ",
        name: "เงินเดือน",
        position: "500.00",
        password: "123456"),
    User(
        username: "รายจ่าย",
        name: "ค่าเช่าหอ",
        position: "2000.00",
        password: "123456"),
    User(
        username: "รายรับ",
        name: "ขายกระเป๋า",
        position: "50000.00",
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
