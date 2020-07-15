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
        child: Card(
          color: Color(0xFFCfDBD5),
          margin: EdgeInsets.all(2.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: GestureDetector(
                          onTap: () {
                            print('Image was clicked!');
                            Navigator.pushNamed(context, ChoiceScreen.id);
                          },
                          child: displayToggle
                              ? Container(
                                  width: 225,
                                  margin: EdgeInsets.only(right: 20),
                                  child: Image.network(imgUrl),
                                )
                              : Container(),
                        ),
                      ),
                      displayToggle
                          ? Text(
                              userQuery,
                              style: TextStyle(fontSize: 20.0),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     margin: EdgeInsets.only(top: 10),
              //     child: Padding(
              //       padding: EdgeInsets.only(right: 40.0, bottom: 10.0),
              //       child: displayToggle
              //           ? Text(
              //               userQuery,
              //               style: TextStyle(fontSize: 20.0),
              //             )
              //           : Text(''),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(
                      () {
                        displayToggle = false;
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    print('search was pressed');
                    var searchResults =
                        await Navigator.pushNamed(context, SwiftSearch.id);
                    updateCard(searchResults);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
