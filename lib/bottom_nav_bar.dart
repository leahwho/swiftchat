import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'data.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({this.buttonCollection});

  final List buttonCollection;
  final firestoreInstance = Firestore.instance;

  void saveBoard() {
    firestoreInstance.collection("boards").add({
        "cards": buttonCollection
    }).then((value) {
      print(value.documentID);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              saveBoard();
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
