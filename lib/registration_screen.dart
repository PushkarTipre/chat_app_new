import 'package:chat_app_new/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'rounded_button.dart';
import 'constants.dart';

class Registration_Screen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State<Registration_Screen> createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                margin: EdgeInsets.all(25.0),
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              style: TextStyle(color: Colors.blueGrey),
              onChanged: (value) {},
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              style: TextStyle(color: Colors.blueGrey),
              onChanged: (value) {},
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Register',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
