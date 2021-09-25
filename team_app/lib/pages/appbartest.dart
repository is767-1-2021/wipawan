import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appbartest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbartest'), actions: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/1');
            },
            icon: Icon(Icons.list_sharp)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(Icons.add_sharp)),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
