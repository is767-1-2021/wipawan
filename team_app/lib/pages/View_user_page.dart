import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class ViewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> user = <String>[
      'Ronnachia.R',
      'Panita.T',
      'Orapan.BN',
      'D',
    ];

    final List<String> name = <String>[
      'Ronnachia',
      'Panita',
      'Orapan',
      'E',
    ];
    final List<String> pos = <String>[
      'Admin',
      'Doctor',
      'Nurse',
      'E',
    ];
    final List<String> pass = <String>[
      'Admin',
      'Doctor',
      'Nurse',
      'E',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('view_user_page'), actions: [
        IconButton(
            onPressed: () {
              ;
            },
            icon: Icon(Icons.list_sharp)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(Icons.add_sharp)),
      ]),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: user.length,
        itemBuilder: (context, index) {
          return UserTile(
              user: UserName(
                  username: '${user[index]}',
                  name: '${name[index]}',
                  position: '${pos[index]}',
                  password: '${pass[index]}'));

          Icons.ac_unit;
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class UserName {
  final String username;
  final String name;
  final String position;
  final String password;

  const UserName(
      {Key? key,
      required this.username,
      required this.name,
      required this.position,
      required this.password});
}

class UserTile extends StatelessWidget {
  final UserName user;
  const UserTile({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetail(user: user),
          ),
        );
      },
      child: Container(
        height: 50,
        color: Colors.amber,
        child: Center(
          child: Text('${user.username}'),
        ),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final UserName user;
  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Deatil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Username: ${user.username}'),
          Text('Firstname Lastname: ${user.name}'),
          Text('Position: ${user.position}')
        ],
      ),
    );
  }
}
