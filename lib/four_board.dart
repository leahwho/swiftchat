import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'bottom_nav_bar.dart';
import 'board_button.dart';

class FourBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('FourBoard'),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: <Widget>[
          BoardButton(),
          BoardButton(),
          BoardButton(),
          BoardButton(),
        ],
      ),
    );
  }
}