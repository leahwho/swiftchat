import 'package:flutter/material.dart';

class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          print('Button pressed!');
          var searchResults = await Navigator.pushNamed(context, '/search');
          updateCard(searchResults);
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.grey.shade300,
                    child: Center(
                      child: displayToggle
                          ? Image.network(imgUrl)
                          : Text(
                              'TAP TO SEARCH',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              displayToggle
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          border: InputBorder.none,
                          hintText: userQuery,
                          hintStyle: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
