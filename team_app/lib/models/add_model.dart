import 'package:flutter/material.dart';

class AddUserModel extends ChangeNotifier {
  String? _userName;
  String? _name;
  String? _position;
  String? _password;

  get userName => this._userName;

  set userName(value) {
    this._userName = value;
    notifyListeners();
    AddUserModel.add(AddUserModel);
  }

  get name => this._name;

  set name(value) {
    this._name = value;
    notifyListeners();
    AddUserModel.add(AddUserModel);
  }

  get position => this._position;

  set position(value) {
    this._position = value;
    notifyListeners();
    AddUserModel.add(AddUserModel);
  }

  get password => this._password;

  set password(value) {
    this._password = value;
    notifyListeners();
    AddUserModel.add(AddUserModel);
  }

  static void add(Type addUserModel) {}
}
