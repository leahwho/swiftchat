import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: Text('SwiftChat'),
          backgroundColor: Colors.purple[900],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100),
              Image(
                image: AssetImage(
                  'images/DeepPurpleCircleLogo.png',
                ),
              ),
              const SizedBox(height: 100), // invisible
              RaisedButton(
                onPressed: () {}, // TODO: Add function!
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Quick Board', style: TextStyle(fontSize: 25)),
                ),
                color: Colors.purple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                onPressed: () {}, // TODO: Add function!
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Login', style: TextStyle(fontSize: 25)),
                ),
                color: Colors.purple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RaisedButton(
                onPressed: () {}, // TODO: Add function!
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Register', style: TextStyle(fontSize: 25)),
                ),
                color: Colors.purple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
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
