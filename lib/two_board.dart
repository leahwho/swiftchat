import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/boom_menu.dart';
import 'bottom_nav_bar.dart';
import 'board_button.dart';

class TwoBoard extends StatelessWidget {
  static String id = 'two_board';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('TwoChoice'),
      //bottomNavigationBar: BottomNavBar(),
      floatingActionButton: SwiftBoomMenu(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 75.0,
        ),
        child: Column(
          children: <Widget>[
            BoardButton(),
            BoardButton(),
          ],
        ),
      ),
    );
  }
}
