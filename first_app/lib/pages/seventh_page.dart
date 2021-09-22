import 'package:flutter/material.dart';

class SeventhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fake animated pic'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoveCat()),
          );
        },
        child: Hero(
          tag: 'Cat',
          child: Image.asset(
            'assets/cat1.png',
            width: 120,
          ),
        ),
      ),
    );
  }
}

class MoveCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'Cat',
            child: Image.asset(
              'assets/cat2.png',
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
