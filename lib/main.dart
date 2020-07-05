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
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Image(
            image: AssetImage( 
              'images/DeepPurpleCircleLogo.png',
            ),
          ),
        ),
      ),
    );
  }
}
