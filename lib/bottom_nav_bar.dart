import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF293241),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
