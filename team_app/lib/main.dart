import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/form_add.dart';
import 'pages/list_view.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
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
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.blueGrey),
        ),
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/1': (context) => ViewUser(),
        '/2': (context) => AddUserPage(),
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
                margin:
                    EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              Text(
                'You have pushed the button this many times:',
              ),
            ]),
      ),
    );
  }
}
