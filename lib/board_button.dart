import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  // state to keep track of:
  // display Text vs display Photo
  // use a ternary for the container's child?  if there is imageState, display image, otherwise display text

  String buttonText = 'EDITABLE TEXT HERE';
  // this should eventually display ONLY if the user has entered a search term and should be the search term itself

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('Button pressed!');
          Navigator.pushNamed(context, '/search');
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
                    hintText: buttonText,
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
