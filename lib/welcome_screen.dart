import 'package:chat_app_new/login_screen.dart';
import 'package:chat_app_new/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;

  //_WelcomeScreenState(this.animation);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.forward();

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller); //Background colour animation

    animation2 = CurvedAnimation(
        parent: controller, curve: Curves.decelerate); //Logo animation

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    //margin: EdgeInsets.only(left: 25.0),
                    child: Image.asset('images/logo.png'),
                    height: animation2.value * 100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: Duration(milliseconds: 80),
                      textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.red),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ],
            ),
            SizedBox(
              height: 45.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, Registration_Screen.id);
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, Login_Screen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
