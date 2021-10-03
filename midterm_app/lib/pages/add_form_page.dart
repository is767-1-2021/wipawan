import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '/providers/user_provider.dart';
import '/models/User.dart';

class AddFormPage extends StatelessWidget {
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
        title: Text('เพิ่มผู้ใช้งาน'),
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
                  labelText: 'Email',
                  hintText: 'you@domain.com',
                  icon: Icon(Icons.email_sharp)),
              controller: usernameController,
              validator: (username) {
                if (username!.contains('@')) {
                  return 'กรุณากรอกอีเมล';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ชื่อ-นามสกุล',
                  icon: Icon(Icons.assignment)),
              controller: nameController,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'กรุณากรอกชื่อ-นามสกุล';
                }

                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'ตำแหน่ง',
                  icon: Icon(Icons.location_city_sharp)),
              controller: positionController,
              validator: (position) {
                if (position == null || position.isEmpty) {
                  return 'กรุณากรอกตำแหน่ง';
                }

                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'รหัสผ่าน',
                  icon: Icon(Icons.vpn_key)),
              controller: passwordController,
              validator: (password) {
                if (password!.length < 6) {
                  return 'กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร';
                }

                return null;
              },
              onSaved: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      _showDialog(context);

                      context.read<UserProvider>().users;

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
                  child: Text('เพิ่ม'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('ยกเลิก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: Text('ล้างข้อมูล'),
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
        title: Text('สำเร็จ'),
        content: Text('คุณได้เพิ่มผู้ใช้งานเรียบร้อยแล้ว'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ;
              },
              child: Text('เพิ่มผู้ใช้งาน'))
        ],
      );
    },
  );
}
