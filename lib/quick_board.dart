import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'board_button.dart';

class QuickBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: replace with AppBar widget
      appBar: AppBar(
        title: Text('SwiftChat'),
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: <Widget>[
          BoardButton(),
          BoardButton(),
        ],
      ),
    );
  }
}
