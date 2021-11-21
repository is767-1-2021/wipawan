import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final int? id_card;
  final String? first_name;
  final String? last_name;
  final String? tel;
  final String? email;
  final String? password;
  final String? position;
  final int? roleId;
  final String? roleName;
  final int? hospitalId;
  final String? hospitalName;

  User(
    this.id_card,
    this.first_name,
    this.last_name,
    this.tel,
    this.email,
    this.password,
    this.position,
    this.roleId,
    this.roleName,
    this.hospitalId,
    this.hospitalName,
  );

  factory User.fromDs(
    Map<String, Object?> json,
  ) {
    return User(
      json['id_card'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['tel'] as String,
      json['email'] as String,
      json['password'] as String,
      json['position'] as String,
      json['roleId'] as int,
      json['roleName'] as String,
      json['hospitalId'] as int,
      json['hospitalName'] as String,
    );
  }

  get fullName => null;

  get firstName => null;
}

class AllUsers {
  final List<User> users;
  AllUsers(this.users);

  factory AllUsers.fromSnapshot(QuerySnapshot s) {
    List<User> users = s.docs.map((DocumentSnapshot ds) {
      return User.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllUsers(users);
  }
}

//State
class UserModel extends ChangeNotifier {
  String? _email;
  String? _first_name;
  String? _last_name;
  String? _password;
  String? _position;
  String? _roleId;
  String? _roleName;
  String? _hospital_id;
  String? _hospital_name;

  get email => this._email;

  set email(value) {
    this._email = value;
    notifyListeners();
  }

  get first_name => this._first_name;

  set first_name(value) {
    this._first_name = value;
    notifyListeners();
  }

  get last_name => this._last_name;

  set last_name(value) {
    this._last_name = value;
    notifyListeners();
  }

  get password => this._password;

  set password(value) {
    this._password = value;
    notifyListeners();
  }

  get position => this._position;

  set position(value) {
    this._position = value;
    notifyListeners();
  }

  get roleId => this._roleId;

  set roleId(value) {
    this._roleId = value;
    notifyListeners();
  }

  get roleName => this._roleName;

  set roleName(value) {
    this._roleName = value;
    notifyListeners();
  }

  get hospital_id => this._hospital_id;

  set hospital_id(value) {
    this._hospital_id = value;
    notifyListeners();
  }

  get hospital_name => this._hospital_name;

  set hospital_name(value) {
    this._hospital_name = value;
    notifyListeners();
  }
}
