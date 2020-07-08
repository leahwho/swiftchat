import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'bottom_nav_bar.dart';
import 'board_button.dart';

class QuickBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftAppBar('QuickBoard'),
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
