import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/User.dart';
import '/providers/user_provider.dart';

class ViewUser extends StatefulWidget {
  @override
  _ViewUserState createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(
            onPressed: () {
              ;
            },
            icon: Icon(Icons.list_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(Icons.person_add),
          )
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
                      SnackBar(content: Text('${data.username} dismissed')));
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
        title: Text('User Deatil'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete_sharp))],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Username: ${user.username}'),
              Text('Name: ${user.name}'),
              Text('Position: ${user.position}'),
              Text('Passeord: ${user.password}'),
            ],
          ),
        ],
      ),
    );
  }
}
