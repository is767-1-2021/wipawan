import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'pages/add_form_page.dart';

import 'pages/list_user_page.dart';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/0': (context) => MyHomePage(
              title: '',
            ),
        '/1': (context) => ListUser(),
        '/2': (context) => AddFormPage(),
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
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "New to this app?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/4');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.app_registration),
                            Text(
                              "ลงทะเบียน",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'ชื่อผู้ใช้งาน',
                            hintText: 'you@domain.com',
                            icon: Icon(Icons.email_sharp)),
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        controller: usernameController,
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'รหัสผ่าน',
                            icon: Icon(Icons.vpn_key),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                })),
                        controller: passwordController,
                      ),
                      Container(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/5');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ลืมรหัสผ่าน',
                              style: TextStyle(
                                color: Colors.blue.shade600,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 1,
                              ),
                            ),
                            Icon(
                              Icons.contact_support_outlined,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  color: Colors.blue.shade100,
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          var username =
                                              usernameController.text;
                                          var password =
                                              passwordController.text;

                                          if ((username ==
                                                  'wipawan.v@gmail.com') &&
                                              (password == '123456')) {
                                            Navigator.pushNamed(context, '/1');
                                            formKey.currentState!
                                                .setState(() {});
                                          } else {}

                                          if ((username ==
                                                  'winai.n@gmail.com') &&
                                              (password == '123456')) {
                                            Navigator.pushNamed(context, '/3');
                                            formKey.currentState!
                                                .setState(() {});
                                          } else {}
                                          if ((username ==
                                                  'orapan.t@gmail.com') &&
                                              (password == '123456')) {
                                            Navigator.pushNamed(context, '/6');
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'อีเมลหรือรหัสผ่านไม่ถูกต้อง')),
                                            );
                                          }

                                          ;
                                          formKey.currentState!.reset();
                                        },
                                        icon: Icon(Icons.login_sharp),
                                      ),
                                      Text('ลงชื่อเข้าใช้'),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.green.shade100,
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          SystemNavigator.pop();
                                        },
                                        icon: Icon(Icons.exit_to_app),
                                      ),
                                      Text('ออกจากแอพ'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/8');
                              },
                              child: Text('Team Dep'),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
