import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swift_chat/data.dart';
import 'home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomNavBar extends StatelessWidget {
  final firestoreInstance = Firestore.instance;

// this will work; now how do you get the data you need to save from the board to the nav bar..?
  void saveBoard() {
    firestoreInstance.collection("boards").add({
      "board_id": 'a test board',
      "board": {
        'card1': {
          'imgUrl': 'www.sometestimage.com',
          'userQuery': 'the user query'
        },
        'card2': {
          'imgUrl': 'www.sometestimage.com',
          'userQuery': 'the user query'
        },
      },
    }).then((value) {
      print(value.documentID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF293241),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              saveBoard();
            },
          ),
        ],
      ),
    );
  }
}
