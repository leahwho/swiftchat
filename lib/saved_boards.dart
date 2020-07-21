import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_chat/home_button.dart';

import 'app_bar.dart';
import 'boom_menu.dart';
import 'bottom_nav_bar.dart';
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
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  Map boardCollection = {};
  bool showSpinner = true;

  bool noBoards = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      // then you can display saved boards?
      if (user != null) {
        loggedInUser = user;
        getData();
        return;
      }
    } catch (error) {
      print(error);
    }
    print('there is no user logged in');
  }

  Future<void> getData() async {
    Map firestoreData = {};

    await firestoreReference
        .collection("boards")
        .where("user", isEqualTo: loggedInUser.email)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      if (snapshot.documents.length > 0) {
        snapshot.documents.forEach((board) {
          firestoreData[board.data['name']] = board.data['cards'];
        });
      } else {
        setState(() {
          noBoards = true;
        });
      }
    });

    setState(() {
      boardCollection = firestoreData;
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Dialog noBoardDialog = Dialog(
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
              child: Text('You have no saved boards',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
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
                    Navigator.pushNamed(context, TwoBoard.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Make One!',
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

    return Scaffold(
      appBar: SwiftAppBar('Saved Boards'),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: SwiftBoomMenu(),
      backgroundColor: Color(0xFF293241),
      body: noBoards
          ? noBoardDialog
          : ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: ListView.builder(
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
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(64, 75, 96, .9),
                          borderRadius: BorderRadius.all(
                            new Radius.circular(2.0),
                          ),
                        ),
                        width: double.infinity,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text(
                            key,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
