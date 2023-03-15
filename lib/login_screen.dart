import 'package:chat_app_new/chat_screen.dart';
import 'package:chat_app_new/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'constants.dart';

class Login_Screen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _auth = FirebaseAuth.instance;
  bool showsSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showsSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    margin: EdgeInsets.all(25.0),
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.blueGrey),
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: '*',
                style: TextStyle(color: Colors.blueGrey),
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 30.0,
              ),
              RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'Login',
                onPressed: () async {
                  setState(() {
                    showsSpinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (newUser.user != null) {
                      Navigator.pushNamed(context, Chat_Screen.id);
                    }
                    setState(() {
                      showsSpinner = false;
                    });
                  } catch (e) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
