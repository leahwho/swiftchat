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
    Map firestoreData = {};

    await firestoreReference
        .collection("boards")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((board) {
        firestoreData[board.data['name']] = board.data['cards'];
      });
    });

    setState(() {
      boardCollection = firestoreData;
    });
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

