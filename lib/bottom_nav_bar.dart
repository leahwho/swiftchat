import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
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
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                saveBoard();
              }, // send args back to board
              child: Text(
                'Save Board',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
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
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
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

// child: BottomNavigationBar(backgroundColor: Color(0xFF293241), items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.save),
//             title: Text('Save'),
//           ),
//         ])

// ConvexAppBar(
//       backgroundColor: Color(0xFF293241),
//       items: [
//         TabItem(icon: Icons.home, title: 'Home'),
//         // TabItem(icon: Icons.map, title: 'Discovery'),
//         TabItem(icon: Icons.add, title: 'Add'),
//         // TabItem(icon: Icons.message, title: 'Message'),
//         TabItem(icon: Icons.save_alt, title: 'Save'),
//       ],
//       initialActiveIndex: 2, //optional, default as 0
//       style: TabStyle.fixedCircle,
//       onTap: (int i) => print('click index=$i'),
//     );
