import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_chat/two_board.dart';
import 'app_bar.dart';
import 'boom_menu.dart';
import 'bottom_nav_bar.dart';
import 'playground.dart';
import 'two_board.dart';
import 'three_board.dart';
import 'four_board.dart';

class SavedBoards extends StatefulWidget {
  static String id = 'saved_boards';

  @override
  _SavedBoardsState createState() => _SavedBoardsState();
}

class _SavedBoardsState extends State<SavedBoards> {
  final firestoreReference = Firestore.instance;

  Map boardCollection = {};
  List boardNames = [
    'A Board You Saved',
    'Another Board',
    'Previously Saved Board',
    'A Nice and Great Board',
    'ANOTHER Board',
    'A Board You Saved 2',
    'Another Board 2',
    'Previously Saved Board 2',
    'A Nice and Great Board 2',
    'ANOTHER Board 2',
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    int i = 0;

    Map firestoreData = {};

    await firestoreReference
        .collection("boards")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((board) {
        firestoreData[boardNames[i]] = board.data['cards'];
        print('this is i: $i');
        print('snapshot length: ${snapshot.documents.length}');
        print('firestoredata length: ${firestoreData.length}');
        i++;
      });
    });

    // print(firestoreData);
    print(
        'board collection inside getData before set state: ${boardCollection.length}');

    setState(() {
      boardCollection = firestoreData;
    });

    print(
        'board collection inside getData after set state: ${boardCollection.length}');

    print('this is boardCollection: $boardCollection');
    // print('this is boardCollection: $boardCollection');
    //
    //     print('this is snapshot: $snapshot');
    //     print('this is board: $board');

    // {cards: [{imgUrl: https://tse2.mm.bing.net/th?id=OIP.kbTlTCycJx0G33oBZ0xJTwHaE8&pid=Api, id: 0, userQuery: chicken tenders, displayToggle: true}, {imgUrl: https://tse2.mm.bing.net/th?id=OIP.4lPYMJo7RhL5rphvjV3qgwHaE8&pid=Api, id: 1, userQuery: sweet potato fries, displayToggle: true}]}

    //to get this data, use: boardData['cards]:
    // [{imgUrl: https://tse2.mm.bing.net/th?id=OIP.kbTlTCycJx0G33oBZ0xJTwHaE8&pid=Api, id: 0, userQuery: chicken tenders, displayToggle: true}, {imgUrl: https://tse2.mm.bing.net/th?id=OIP.4lPYMJo7RhL5rphvjV3qgwHaE8&pid=Api, id: 1, userQuery: sweet potato fries, displayToggle: true}]

    // set that as your variable, and then send it to the BoardController

    // overate initState by setting buttonCollection to this data

    // you will need to refactor the board to take in the number of cards to render, I think

    // for now, just display some silly board names to render as the board title!  you can figure out the naming of boards later on.]
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: SwiftAppBar('Saved Boards'),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: SwiftBoomMenu(),
      body: ListView.builder(
        itemCount: boardCollection.length,
        itemBuilder: (context, index) {
          String key = boardCollection.keys.elementAt(index);
          return GestureDetector(
            onTap: () {
              if (boardCollection[key].length == 2) {
                Navigator.pushNamed(context, TwoBoard.id,
                    arguments: boardCollection[key]);
              } else if (boardCollection[key].length == 3) {
                Navigator.pushNamed(context, ThreeBoard.id,
                    arguments: boardCollection[key]);
              } else if (boardCollection[key].length == 4) {
                Navigator.pushNamed(context, FourBoard.id,
                    arguments: boardCollection[key]);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  key,
                ),
              ),
            ),
          );
        },
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

// [
//   [
//     {imgUrl: 'https://tse4.mm.bing.net/th?id=OIP.mfmD1OVi0K7ZLou20rRNgwHaE8&pid=Api', id: 0, userQuery: cheeseburger , displayToggle: true},
//      {imgUrl: 'https://tse1.mm.bing.net/th?id=OIP.JDmy5Zig_uVnhaGRQfp0NQHaEK&pid=Api', id: 1, userQuery: chicken burger, displayToggle: true}
//   ],
//   [
//     {imgUrl: 'https://tse3.mm.bing.net/th?id=OIP.LoYWriwp3MKP4zBaA5UFZgHaD4&pid=Api', id: 0, userQuery: chicken, displayToggle: true},
//     {imgUrl: 'https://tse1.mm.bing.net/th?id=OIP.rGAJX9qCG3zlXfSQf4cCGQHaFd&pid=Api', id: 1, userQuery: duck, displayToggle: true},
//     {imgUrl: 'https://tse3.mm.bing.net/th?id=OIP.rfCLyytesSRKbP0J3yhX9QHaD4&pid=Api', id: 2, userQuery: turkey, displayToggle: true},
//     {imgUrl: 'https://tse1.mm.bing.net/th?id=OIP.rmosPO9VzJqufawV3czgqgHaGf&pid=Api', id: 3, userQuery: crow, displayToggle: true}
//   ],
//   [
//     {imgUrl: 'https://tse2.mm.bing.net/th?id=OIP.kbTlTCycJx0G33oBZ0xJTwHaE8&pid=Api', id: 0, userQuery: chicken tenders, displayToggle: true},
//     {imgUrl: 'https://tse2.mm.bing.net/th?id=OIP.4lPYMJo7RhL5rphvjV3qgwHaE8&pid=Api', id: 1, userQuery: sweet potato fries, displayToggle: true}
//   ]
// ]
