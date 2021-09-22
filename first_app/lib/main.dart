import 'package:first_app/Models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/first_page.dart';
import 'pages/second_page.dart';
import 'pages/seventh_page.dart';
import 'pages/third_page.dart';
import 'pages/forth_page.dart';
import 'pages/fifth_page.dart';
import 'pages/sixth_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/5',
      routes: <String, WidgetBuilder>{
        '/1': (context) => FirstPage(),
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage(),
        '/4': (context) => ForthPage(),
        '/5': (context) => FifthPage(),
        '/6': (context) => SixthPage(),
        '/7': (context) => SeventhPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Image cat = Image.asset(
    'assets/cat1.png',
    width: 200,
  );

  Image cat1 = Image.asset(
    'assets/cat1.png',
    width: 200,
  );

  Image cat2 = Image.asset(
    'assets/cat2.png',
    width: 200,
  );

  void _incrementCounter() {
    setState(() {
      cat = cat1;
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      cat = cat2;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.25),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: cat,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    onPressed: _decrementCounter,
                    child: Text('Decrease'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: _incrementCounter,
                    child: Text('Increase'),
                  ),
                ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.headphones),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String ButtonText;
  SubmitButton(this.ButtonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.ButtonText),
      onPressed: () {
        print('pressing....');
      },
    );
  }
}
