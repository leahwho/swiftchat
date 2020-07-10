import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:swift_chat/result.dart';

class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  String imgUrl;
  String userQuery;

  String buttonText = 'EDITABLE TEXT HERE';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          print('Button pressed!');
          Result searchResults = await Navigator.pushNamed(context, '/search');
          // print(searchResults.imgUrl);
          userQuery = searchResults.userQuery;
          imgUrl = searchResults.imgUrl;
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.grey.shade100,
                  child: Center(
                    child: Text(
                      'TAP TO ADD IMAGE',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: userQuery ?? buttonText,
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
