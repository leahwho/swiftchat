import 'package:flutter/material.dart';

import 'package:swift_chat/app_bar.dart';
import 'app_bar.dart';
import 'boom_menu.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Welcome'),
      floatingActionButton: SwiftBoomMenu(),
      body: Center(
        child: Text(
          'Welcome back to this great page! From here, let us give users a way to access their saved boards!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
      // access your saved boards!
      // make a new board!
    );
  }
}
