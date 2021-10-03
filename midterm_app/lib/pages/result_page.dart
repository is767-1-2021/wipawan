import 'package:flutter/material.dart';

class Result_Page extends StatefulWidget {
  const Result_Page({Key? key}) : super(key: key);

  @override
  _Result_PageState createState() => _Result_PageState();
}

class _Result_PageState extends State<Result_Page> {
  Image winai = Image.asset(
    'assets/winai.jpg',
    width: 200,
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกผลการตรวจ'),
      ),
      body: Card(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: winai),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'ชื่อ-นามสกุล : นายวินัย นาดี',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),

                // Consumer<FirstFormModel>(
                // builder: (context, form, child) {
                //   return Text('${form.firstName} ${form.lastName} ${form.age}');
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'ชื่อ-นามสกุล : นายวินัย นาดี',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "เบอร์โทรศัพท์ :0 2123 4567",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "โรงพยาบาลที่ตรวจ : รพ.ธรรมศาสตร์",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "วันที่เข้ารับการตรวจ : 3 ต.ค. 64",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("ติดเชื้อ"),
                      onPressed: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return approve();
                        // })
                        // );
                      },
                    ),
                    SizedBox(width: 20, height: 50),
                    ElevatedButton(
                      child: Text("ไม่ติดเชื้อ"),
                      onPressed: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return approve();
                        // })
                        // );
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
