import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/boom_menu.dart';
import 'board_button.dart';
import 'bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TwoBoard extends StatefulWidget {
  static String id = 'two_board';

  @override
  _TwoBoardState createState() => _TwoBoardState();
}

class _TwoBoardState extends State<TwoBoard> {
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Two Choices'),
      bottomNavigationBar: BottomNavBar(),
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

