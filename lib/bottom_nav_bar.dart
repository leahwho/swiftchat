import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_chat/about.dart';
import 'package:swift_chat/signin_screen.dart';

import 'home_screen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.buttonCollection});

  final List buttonCollection;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String boardName;
  FirebaseUser loggedInUser;
  bool userLoggedIn = false;
  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void saveBoard() {
    try {
      firestoreInstance.collection("boards").add({
        "name": boardName,
        "cards": widget.buttonCollection,
        "user": loggedInUser.email
      }).then((value) {
        print('Successfully saved with this document ID: ${value.documentID}');
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFFe8eddf),
            content: Text(
              'Successfully saved your board!',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        );
      });
    } catch (error) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(error)));
    }
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

  @override
  Widget build(BuildContext context) {
    Dialog saveDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFcfdbd5),
            borderRadius: BorderRadius.circular(10.0)),
        height: 200.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (text) {
                  boardName = text;
                },
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF293241),
                    ),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFe8eddf),
                  hintText: 'Board Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Color(0xFF293241),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    saveBoard();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Save Board',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return BottomAppBar(
      color: Color(0xFF293241),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Color(0xFFe8eddf),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            color: Color(0xFFe8eddf),
            onPressed: () {
              Navigator.pushNamed(context, AboutScreen.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            color: Color(0xFF293241),
            onPressed: () {},
          ),
          userLoggedIn
              ? IconButton(
                  icon: Icon(Icons.save),
                  color: Color(0xFFe8eddf),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) => saveDialog);
                  },
                )
              : IconButton(
                  icon: Icon(Icons.portrait),
                  color: Color(0xFFe8eddf),
                  onPressed: () {
                    Navigator.pushNamed(context, SigninScreen.id);
                  },
                ),
        ],
      ),
    );
  }
}
