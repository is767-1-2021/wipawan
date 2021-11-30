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
                  labelText: 'ประเภท',
                  hintText: 'รายรับ / รายจ่าย',
                  icon: Icon(Icons.email_sharp)),
              controller: usernameController,
              validator: (username) {
                if ((username == null || username.isEmpty)) {
                  return 'กรุณากรอกประเภท';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'รายการ',
                  icon: Icon(Icons.assignment)),
              controller: nameController,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'กรุณากรอกรายการ';
                }

                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'จำนวนเงิน',
                  hintText: '500.00',
                  icon: Icon(Icons.assignment)),
              controller: positionController,
              validator: (position) {
                if (position == null || position.isEmpty) {
                  return 'กรุณากรอกจำนวนเงิน';
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

                      print(username);
                      print(name);
                      print(position);

                      //เตรียมข้อมูล
                      User statement = User(
                        username: username,
                        name: name,
                        position: position,
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
              child: Text('เพิ่มรายการ'))
        ],
      );
    },
  );
}
