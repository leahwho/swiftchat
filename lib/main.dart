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
              Image(
                image: AssetImage(
                  'images/DeepPurpleCircleLogo.png',
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                child: const Text('New Board', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
