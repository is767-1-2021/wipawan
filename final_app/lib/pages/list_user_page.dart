import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '/models/User.dart';
import '/providers/user_provider.dart';
import 'add_form_page.dart';

class ListUser extends StatefulWidget {
  @override
  _ViewUserState createState() => _ViewUserState();
}

class _ViewUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calendar_today_rounded),
        title: Text('รายรับ-รายจ่าย'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${data.name} ${data.position} ถูกลบ')));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: FittedBox(
                        child: Icon(Icons.person),
                      ),
                    ),
                    title: Text('${data.name}'),
                    trailing: Text('${data.position}'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
