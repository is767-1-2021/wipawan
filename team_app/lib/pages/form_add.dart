import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/user_provider.dart';
import '/models/User.dart';

class AddUserPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //controller
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddUser'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.list_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_add))
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                  icon: Icon(Icons.assignment)),
              controller: usernameController,
              validator: (username) {
                if (username == null || username.isEmpty) {
                  return 'Please enter username';
                }

                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                  icon: Icon(Icons.face)),
              controller: nameController,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'Please enter Name';
                }

                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Position',
                  icon: Icon(Icons.location_city_sharp)),
              controller: positionController,
              validator: (position) {
                if (position == null || position.isEmpty) {
                  return 'Please enter position';
                }

                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                  icon: Icon(Icons.vpn_key)),
              controller: passwordController,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'Please enter paswword';
                }

                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _showDialog(context);

                      var username = usernameController.text;
                      var name = nameController.text;
                      var position = positionController.text;
                      var password = passwordController.text;

                      print(username);
                      print(name);
                      print(position);
                      print(password);

                      //เตรียมข้อมูล
                      User statement = User(
                        username: username,
                        name: name,
                        position: position,
                        password: password,
                      );

                      //เรียก provider UserProvider provider = Provider.of<UserProvider>(context, listen: false);

                      var provider =
                          Provider.of<UserProvider>(context, listen: false);

                      provider.addUser(statement);
                    }
                    ;
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Well done'),
        content: Text('You add user already'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      );
    },
  );
}
