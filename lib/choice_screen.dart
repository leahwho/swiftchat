import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';

class ChoiceScreen extends StatelessWidget {
  static String id = 'choice_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Choice!'),
      bottomNavigationBar: BottomNavBar(),
      body: Text('Your choice is gonna be right here'),
    );
  }
}
