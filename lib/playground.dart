import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'search.dart';
import 'app_bar.dart';
import 'boom_menu.dart';

// this is a playground to see if you can get your button layout the way you want it!

class Playground extends StatefulWidget {
  static String id = 'playground_screen';

  @override
  _PlaygroundState createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftAppBar('Playground'),
      backgroundColor: Color(0xFF293241),
      floatingActionButton: SwiftBoomMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
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
                            },
                            child: Image.network(
                                'http://pressbooks-dev.oer.hawaii.edu/math111/wp-content/uploads/sites/17/2017/11/border1-300x290.png'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text('Peanuts', style: TextStyle(fontSize: 25.0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          print('Clear was pressed!');
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          print('search was pressed');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color(0xFFCfDBD5),
                margin: EdgeInsets.all(2.0),
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
