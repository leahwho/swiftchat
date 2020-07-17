import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/horiz_button.dart';
import 'boom_menu.dart';
import 'horiz_button.dart';
import 'bottom_nav_bar.dart';

class FourBoard extends StatefulWidget {
  static String id = 'four_board';

  @override
  _FourBoardState createState() => _FourBoardState();
}

class _FourBoardState extends 
State<FourBoard> {

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

    for (int i = 0; i < 4; i++) {
      print(currentId);
      buttons.add(
        {
          'imgUrl': '',
          'userQuery': '',
          'id': currentId,
          'displayToggle': false,
        },
      );
      currentId++;
      print(currentId);
    }
    print('here is buttons from generateButtons: $buttons');

    setState(() {
      buttonCollection = buttons;
    });
  }

  void searchResultsCallback(dynamic searchResults, id) {
    print('this is search results from callback $searchResults');
    print(
        'this is button collection from callback before setstate: $buttonCollection');
    print('this is id from callback: $id');

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
    print(
        'this is button collection from callback after setstate: $buttonCollection');
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
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Four Choices'),
      bottomNavigationBar: BottomNavBar(buttonCollection: buttonCollection),
      floatingActionButton: SwiftBoomMenu(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 75.0,
        ),
        child: Column(
          children: <Widget>[
            for (var button in buttonCollection)
              HorizButton(
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
