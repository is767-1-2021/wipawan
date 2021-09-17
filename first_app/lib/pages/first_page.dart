import 'package:first_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _formData = 'please click to fill the form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              icon: Icon(Icons.face)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              icon: Icon(Icons.food_bank)),
          IconButton(onPressed: () {}, icon: Icon(Icons.electric_car)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('$_formData'),
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/6');

                if (response != null && !response.toString().isEmpty) {
                  setState(() {
                    _formData = response.toString();
                  });
                }
              },
              child: Text('fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}
