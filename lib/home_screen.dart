import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swift_chat/home_button.dart';
import 'home_button.dart';

// TODO: Do you need these?
import 'bottom_nav_bar.dart';
import 'app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SwiftAppBar('SwiftChat'),
      // bottomNavigationBar: BottomNavBar(),
      body: Container(
        color: Color(0xFF293241),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 120),
            Text(
              'SwiftChat',
              style: TextStyle(
                fontFamily: 'FasterOne',
                color: Color(0xFFe8eddf),
                fontSize: 55.0,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 300.0,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'images/bird.png',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30), // invisible
            HomeButton(
              'QuickBoard',
              'quickboard',
              Icons.add_circle,
            ),
            HomeButton(
              'ThreeBoard',
              'threeboard',
              Icons.save,
            ),
            HomeButton(
              'FourBoard',
              'fourboard',
              Icons.four_k,
            ),
            HomeButton(
              'Saved Boards',
              'saved',
              Icons.save,
            ),
          ],
        ),
      ),
    );
  }
}
