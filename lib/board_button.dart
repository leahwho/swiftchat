import 'package:flutter/material.dart';

class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print('Button pressed!');
          // when this button is pressed, open a search drawer that is a grid view
        },
        child: Container(
          // outer container
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    print('edit text button tapped!');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'EDITABLE TEXT HERE',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
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
