import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class SwiftAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  SwiftAppBar(this.title);
  
  Size get preferredSize => Size.fromHeight(50);

  @override
  _SwiftAppBarState createState() => _SwiftAppBarState();
}

class _SwiftAppBarState extends State<SwiftAppBar> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  bool userLoggedIn = false;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      // then you can display saved boards?
      if (user != null) {
        loggedInUser = user;
        setState(() {
          userLoggedIn = true;
        });
        print('${loggedInUser.email} is logged in');
        return;
      }
    } catch (error) {
      print(error);
    }
    print('there is no user logged in');
  }

  void logOut() {
    if (_auth.currentUser() != null) {
      _auth.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Color(0xFFe8eddf),
        ),
      ),
      actions: <Widget>[
        userLoggedIn ? IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Color(0xFFe8eddf),
          ),
          onPressed: () {
            logOut();
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ) : SizedBox(width: 0),
      ],
      backgroundColor: Color(0xFF293241),
    );
  }
}

// class SwiftAppBar extends StatelessWidget implements PreferredSizeWidget {
//   Size get preferredSize => new Size.fromHeight(kToolbarHeight);

//   SwiftAppBar(this.title);

//   final String title;
//   final _auth = FirebaseAuth.instance;

//   void logOut() {
//     if (_auth.currentUser() != null) {
//       _auth.signOut();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Color(0xFFe8eddf),
//         ),
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(
//             Icons.exit_to_app,
//             color: Color(0xFFe8eddf),
//           ),
//           onPressed: () {
//             logOut();
//             Navigator.pushNamed(context, HomeScreen.id);
//           },
//         ),
//       ],
//       backgroundColor: Color(0xFF293241),
//     );
//   }
// }
