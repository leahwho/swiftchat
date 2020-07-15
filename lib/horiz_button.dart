import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';

class HorizButton extends StatefulWidget {
  @override
  _HorizButtonState createState() => _HorizButtonState();
}

class _HorizButtonState extends State<HorizButton> {
  String imgUrl;
  String userQuery;
  bool displayToggle = false;

  void updateCard(dynamic searchResults) {
    if (searchResults == null) {
      print('your search results are null! ugh!');
    } else {
      imgUrl = searchResults['imgUrl'];
      userQuery = searchResults['userQuery'];
      setState(() {
        displayToggle = true;
        print(imgUrl);
        print(userQuery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color(0xFFCfDBD5),
            ),
            margin: EdgeInsets.all(2.0),
            child: Row(
              children: <Widget>[
                displayToggle
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ChoiceScreen.id);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(imgUrl)),
                            width: 325,
                          ),
                        ),
                      )
                    : Container(
                        width: 345,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TODO: Figure out how to display text
                    // displayToggle ? Text(userQuery) : Text(''),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        print('Search pressed!');
                        var searchResults =
                            await Navigator.pushNamed(context, SwiftSearch.id);
                        updateCard(searchResults);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        print('Cancel pressed!');
                        setState(() {
                          displayToggle = false;
                          imgUrl = '';
                        });
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
