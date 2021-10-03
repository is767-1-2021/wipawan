import 'package:flutter/material.dart';
import 'package:midterm_app/widgets/primary_button.dart';
import '/widgets/primary_button.dart';
import '/widgets/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "ตั้งค่ารหัสผ่านใหม่",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Reset password"),
              ResetForm(),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: PrimaryButton(buttonText: "ยืนยัน"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
