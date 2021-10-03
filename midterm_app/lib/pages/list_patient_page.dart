import 'package:flutter/material.dart';

class ListPatientPage extends StatefulWidget {
  @override
  _ListPatientPageState createState() => _ListPatientPageState();
}

class _ListPatientPageState extends State<ListPatientPage> {
  Image winai = Image.asset(
    'assets/winai.jpg',
  );
  @override
  Widget build(BuildContext context) {
    final List<String> namee = <String>[
      'winai.n@gmail.com',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('รายชื่อผู้เข้ารับการตรวจ'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: namee.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: winai,
                        ),
                      ),
                      title: Text('${namee[index]}'),
                      subtitle: Text('รพ.ธรรมศาสตร์'),
                      onTap: () {
                        Navigator.pushNamed(context, '/7');
                      }));
            }));
  }
}
