import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/User.dart';
import '/providers/user_provider.dart';

class ListUser extends StatefulWidget {
  @override
  _ViewUserState createState() => _ViewUserState();
}

class _ViewUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อผู้ใช้งาน'),
        actions: [
          IconButton(
            onPressed: () {
              ;
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(Icons.add_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, UserProvider provider, child) {
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, int index) {
              User data = provider.users[index];
              return Dismissible(
                key: ValueKey(provider.users[index]),
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    provider.users.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${data.username} ถูกลบ')));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Icon(Icons.person),
                      ),
                    ),
                    title: Text('${data.username}'),
                    subtitle: Text('${data.position}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetail(user: data),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลผู้ใช้งาน'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ชื่อผู้ใช้: ${user.username}'),
              Text('ชื่อ-นามสกุล: ${user.name}'),
              Text('ตำแหน่ง: ${user.position}'),
              Text('รหัสผ่าน: ${user.password}'),
            ],
          ),
        ],
      ),
    );
  }
}
