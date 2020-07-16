import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';
import 'data.dart';

class BoardButton extends StatelessWidget {
  BoardButton(
      {this.id,
      this.imgUrl,
      this.userQuery,
      this.displayToggle,
      this.searchResults,
      this.onClearClick});

  final int id;
  final String imgUrl;
  final String userQuery;
  final bool displayToggle;
  final Function searchResults;
  final Function onClearClick;

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
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: GestureDetector(
                      onTap: () {
                        print('Image was clicked!');

                        Data data =
                            new Data(imgUrl: imgUrl, userQuery: userQuery);
                        Navigator.pushNamed(context, ChoiceScreen.id,
                            arguments: data);
                      },
                      child: Container(
                        height: 225,
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child:
                            displayToggle ? Image.network(imgUrl) : Container(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: displayToggle
                      ? Text(userQuery, style: TextStyle(fontSize: 25.0))
                      : Text(''),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    print('Clear was pressed!');
                    this.onClearClick();
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
                    this.searchResults(searchResults, id);
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
