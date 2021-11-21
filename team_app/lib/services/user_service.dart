import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:icovid/models/user_model.dart';

abstract class UserServices {
  Future<List<User>> getUsers();
  Future<void> addUser(User items);
}

class FirebaseServices extends UserServices {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('icovid_user');

  @override
  Future<List<User>> getUsers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('icovid_user').get();

    AllUsers users = AllUsers.fromSnapshot(snapshot);
    return users.users;
  }

  @override
  Future<void> addUser(User items) {
    print('items.email:${items.email}');
    return _ref.add({
      'email': items.email,
      'firstName': items.first_name,
      'lastName': items.last_name,
      'password': items.password,
      'position': items.position,
      'roleID': items.roleId,
      'roleName': items.roleName,
      'hospitalID': items.hospitalId,
      'hospitalName': items.hospitalName,
    });
    //.then((value) => print('Booking Added'))
    //.catchError((error) => print("Failed to add Booking: $error"));
  }
}
