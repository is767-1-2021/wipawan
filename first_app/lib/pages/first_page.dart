import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.face)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
          IconButton(onPressed: () {}, icon: Icon(Icons.electric_car)),
        ],
      ),
    );
  }
}
