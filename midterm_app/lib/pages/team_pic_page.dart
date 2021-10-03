import 'package:flutter/material.dart';

class TeamPicPage extends StatelessWidget {
  Image ron = Image.asset(
    'assets/ron.png',
    height: 150,
    width: 150,
  );

  Image tang = Image.asset(
    'assets/tang.png',
    height: 150,
    width: 150,
  );

  Image chanel = Image.asset(
    'assets/chanel.png',
    height: 150,
    width: 150,
  );

  Image may = Image.asset(
    'assets/may.png',
    height: 150,
    width: 150,
  );

  Image bonus = Image.asset(
    'assets/bonus.png',
    height: 150,
    width: 150,
  );
  Image winai = Image.asset(
    'assets/winai.jpg',
    height: 200,
    width: 200,
  );
  Image gift = Image.asset(
    'assets/gift.jpg',
    height: 200,
    width: 200,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทีมงาน'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.amberAccent,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      child: (Column(
                        children: [
                          ron,
                          Text(
                            'Ronnachai',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      )),
                    ),
                    Container(
                      child: (Column(
                        children: [
                          tang,
                          Text('Panita',
                              style: TextStyle(
                                fontSize: 25.0,
                              ))
                        ],
                      )),
                    ),
                    Container(
                      child: (Column(
                        children: [
                          chanel,
                          Text('Chavisa',
                              style: TextStyle(
                                fontSize: 25.0,
                              ))
                        ],
                      )),
                    ),
                    Container(
                      child: (Column(
                        children: [
                          may,
                          Text('Ganokporn',
                              style: TextStyle(
                                fontSize: 25.0,
                              ))
                        ],
                      )),
                    ),
                    Container(
                      child: (Column(
                        children: [
                          bonus,
                          Text('Orapan',
                              style: TextStyle(
                                fontSize: 25.0,
                              ))
                        ],
                      )),
                    ),
                    Container(
                      child: (Column(
                        children: [
                          gift,
                          Text('Wipawan',
                              style: TextStyle(
                                fontSize: 25.0,
                              ))
                        ],
                      )),
                    ),
                    Container(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Center(
                child: (Column(
                  children: [
                    Container(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue.shade200,
                      child: Column(
                        children: [
                          Text('Special Thanks',
                              style: TextStyle(
                                fontSize: 40.0,
                              )),
                          winai,
                          Text('Aj.Winai Nadee',
                              style: TextStyle(
                                fontSize: 25.0,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
