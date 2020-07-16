import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';
import 'data.dart';

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
                          onTap: () async {
                            print('Image was clicked!');
                            // here we send the data to the next page
                            Data data =
                                new Data(imgUrl: imgUrl, userQuery: userQuery);
                            Navigator.pushNamed(context, ChoiceScreen.id,
                                arguments: data);
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
