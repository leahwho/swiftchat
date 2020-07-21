import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class SwiftAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  SwiftAppBar(this.title);

  final String title;
  final _auth = FirebaseAuth.instance;

  void logOut() {
    if (_auth.currentUser() != null) {
      _auth.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFFe8eddf),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Color(0xFFe8eddf),
          ),
          onPressed: () {
            logOut();
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ),
      ],
      backgroundColor: Color(0xFF293241),
    );
  }
}
