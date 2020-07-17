import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/boom_menu.dart';
import 'package:swift_chat/bottom_nav_bar.dart';

class SavedBoards extends StatefulWidget {
  static String id = 'saved_boards';

  @override
  _SavedBoardsState createState() => _SavedBoardsState();
}

class _SavedBoardsState extends State<SavedBoards> {
  final firestoreReference = Firestore.instance;
  Map boardData = {};

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<Map> getData() async {
    await firestoreReference
        .collection("boards")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((board) {
        // print('this is snapshot: $snapshot');
        // print('this is board: $board');
        // print('this is board.data: ${board.data}');
        boardData = board.data;
      });
    });

    return boardData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftAppBar('Saved Boards'),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: SwiftBoomMenu(),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}

// FutureBuilder(
//     future: dbRef.once(),
//     builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
//         if (snapshot.hasData) {
//         lists.clear();
//         Map<dynamic, dynamic> values = snapshot.data.value;
//         values.forEach((key, values) {
//             lists.add(values);
//         });
//         return new ListView.builder(
//             shrinkWrap: true,
//             itemCount: lists.length,
//             itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                     Text("Name: " + lists[index]["name"]),
//                     Text("Age: "+ lists[index]["age"]),
//                     Text("Type: " +lists[index]["type"]),
//                     ],
//                 ),
//                 );
//             });
//         }
//         return CircularProgressIndicator();
//     })




// class SavedBoard {
//   final int id;
//   String imgUrl;
//   String userQuery;
//   bool displayToggle;

//   SavedBoard.fromJson(this.id, Map data) {
//     imgUrl = data['imgUrl'];
//     if (imgUrl == null) {
//       imgUrl =
//           'https://user-images.githubusercontent.com/2351721/31314483-7611c488-ac0e-11e7-97d1-3cfc1c79610e.png';
//     }

//     userQuery = data['userQuery'];
//     if (userQuery == null) {
//       userQuery = '';
//     }

//     displayToggle = data['displaytoggle'];
//     if (displayToggle = null) {
//       displayToggle = true;
//     }
//   }
// }