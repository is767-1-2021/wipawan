import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/User.dart';
import 'package:test_app/provider/user_provider.dart';

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Username',
              ),
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
              ),
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
              ),
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
              ),
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

                      Navigator.pop(context);
                    }
                    ;
                  },
                  child: Text('Confirm'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
