import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/User.dart';
import 'package:test_app/provider/user_provider.dart';

class ViewUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(Icons.add_sharp),
          )
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, UserProvider provider, child) {
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, int index) {
              User data = provider.users[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text('${data.position}'),
                    ),
                  ),
                  title: Text('${data.username}'),
                  subtitle: Text('${data.name}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
