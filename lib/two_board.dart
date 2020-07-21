import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/boom_menu.dart';
import 'board_button.dart';
import 'bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TwoBoard extends StatefulWidget {
  static String id = 'two_board';

  @override
  _TwoBoardState createState() => _TwoBoardState();
}

class _TwoBoardState extends State<TwoBoard> {
  final firestoreInstance = Firestore.instance;
  dynamic data;

  List buttonCollection = [];
  String imgUrl;
  String userQuery;
  bool displayToggle = false;

  @override
  void initState() {
    super.initState();
    generateButtons();
  }

  void generateButtons() {
    List buttons = [];
    int currentId = 0;

    for (int i = 0; i < 2; i++) {
      // print(currentId);
      buttons.add(
        {
          'imgUrl': '',
          'userQuery': '',
          'id': currentId,
          'displayToggle': false,
        },
      );
      currentId++;
      // print(currentId);
    }
    // print('here is buttons from generateButtons: $buttons');

    setState(() {
      buttonCollection = buttons;
    });
  }

  void searchResultsCallback(dynamic searchResults, id) {
      List newButtons = [];

    if (searchResults == null) {
      print('your search results are null! ugh! better luck next time');
    } else {
      for (var button in buttonCollection) {
        if (button['id'] == id) {
          button['imgUrl'] = searchResults['imgUrl'];
          button['userQuery'] = searchResults['userQuery'];
          button['displayToggle'] = true;
          newButtons.add(button);
        } else {
          newButtons.add(button);
        }
      }
    }
    setState(() {
      buttonCollection = newButtons;
    });
  }

  void clearClick(id) {
    List newButtons = [];

    for (var button in buttonCollection) {
      if (button['id'] == id) {
        button['imgUrl'] = '';
        button['userQuery'] = '';
        button['displayToggle'] = false;
        newButtons.add(button);
      } else {
        newButtons.add(button);
      }
    }

    setState(() {
      buttonCollection = newButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    data = settings.arguments;

    if (data != null) {
      setState(() {
        buttonCollection = data;
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Two Choices'),
      bottomNavigationBar: BottomNavBar(buttonCollection: buttonCollection),
      floatingActionButton: SwiftBoomMenu(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 75.0,
        ),
        child: Column(
          children: <Widget>[
            for (var button in buttonCollection)
              BoardButton(
                imgUrl: button['imgUrl'],
                userQuery: button['userQuery'],
                id: button['id'],
                displayToggle: button['displayToggle'],
                searchResults: searchResultsCallback,
                onClearClick: clearClick,
              )
          ],
        ),
      ),
    );
  }
}
