import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'chat_screen.dart';

void main() {
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: login_screen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Login_Screen.id: (context) => Login_Screen(),
        Registration_Screen.id: (context) => Registration_Screen(),
        Chat_Screen.id: (context) => Chat_Screen(),
      },
    );
  }
}
