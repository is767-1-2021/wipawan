import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form & Validator'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your FirstName',
              icon: Icon(Icons.business),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter FirstName';
              }

              return null;
            },
            onSaved: (value) {
              _firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your LastName',
              icon: Icon(Icons.family_restroom),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter LastName';
              }

              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your age',
              icon: Icon(Icons.ring_volume),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter age';
              }

              if (int.parse(value) < 18) {
                return 'Please enter valid age.';
              }

              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                var response = 'Good Job = $_firstName $_lastName $_age';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(response),
                ));

                Navigator.pop(context, response);
              }
            },
            child: Text('Validate'),
          )
        ],
      ),
    );
  }

  outlineInputBorder() {}
}
