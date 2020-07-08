import 'package:flutter/material.dart';
import 'board_button.dart';

class QuickBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QuickBoard',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          BoardButton(),
          BoardButton(),
        ],
      ),
    );
  }
}
