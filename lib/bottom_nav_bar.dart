import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({this.buttonCollection});

  final List buttonCollection;
  String boardName;
  final firestoreInstance = Firestore.instance;

  void saveBoard() {
    firestoreInstance
        .collection("boards")
        .add({"name": boardName, "cards": buttonCollection}).then((value) {
      print(value.documentID);
    });
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
      // shape: CircularNotchedRectangle(),
      // notchMargin: 5.0,
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
            icon: Icon(Icons.save),
            color: Color(0xFFe8eddf),
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) => saveDialog);
            },
          ),
        ],
      ),
    );
  }
}

