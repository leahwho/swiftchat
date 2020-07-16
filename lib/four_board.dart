import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/horiz_button.dart';
import 'boom_menu.dart';
import 'horiz_button.dart';
import 'bottom_nav_bar.dart';

class FourBoard extends StatelessWidget {
  static String id = 'four_board';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Four Choices'),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: SwiftBoomMenu(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 75.0,
        ),
        child: Column(
          children: <Widget>[
            HorizButton(),
            HorizButton(),
            HorizButton(),
            HorizButton(),
          ],
        ),
      ),
    );
  }
}
