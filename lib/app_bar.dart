import 'package:flutter/material.dart';

class SwiftAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  SwiftAppBar(this.title);

  final String title;

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
          onPressed: null,
          // onPressed: () {
          //   _auth.signOut(),
          //   Navigator.pop(context);
          // },
        ),
      ],
      backgroundColor: Color(0xFF293241),
    );
  }
}
