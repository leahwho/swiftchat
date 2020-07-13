// packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// screens & components
import 'home_button.dart';
import 'boom_menu.dart';
// TODO: Do you need these?
import 'bottom_nav_bar.dart';
import 'app_bar.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SwiftAppBar('SwiftChat'),
      // bottomNavigationBar: BottomNavBar(),

      body: Container(
        width: double.infinity,
        color: Color(0xFF293241),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SwiftChat',
              style: GoogleFonts.chelseaMarket(
                textStyle: TextStyle(
                  color: Color(0xFFcfdbd5),
                  fontSize: 70.0,
                ),
              ),
            ),
            SizedBox(height: 30),
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
            // HomeButton(
            //   'QuickBoard',
            //   'quickboard',
            //   Icons.add_circle,
            // ),
            // HomeButton(
            //   'ThreeBoard',
            //   'threeboard',
            //   Icons.save,
            // ),
            // HomeButton(
            //   'FourBoard',
            //   'fourboard',
            //   Icons.four_k,
            // ),
            // HomeButton(
            //   'Saved Boards',
            //   'saved',
            //   Icons.save,
            // ),
          ],
        ),
      ),
      floatingActionButton: SwiftBoomMenu(),
    );
  }
}
