import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add_User_Page'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.list_sharp)),
        IconButton(onPressed: () {}, icon: Icon(Icons.add_sharp)),
      ]),
      body: AddUserForm(),
    );
  }
}

class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _name;
  String? _position;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Username',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }

                return null;
              },
              onSaved: (value) {
                _userName = value;
              }),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name and LastName',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Name and LastName';
                }

                return null;
              },
              onSaved: (value) {
                _name = value;
              }),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Position',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Position';
                }

                return null;
              },
              onSaved: (value) {
                _position = value;
              }),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }

                return null;
              },
              onSaved: (value) {
                _password = value;
              }),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context);
              }
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
