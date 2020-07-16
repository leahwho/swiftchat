import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/home_screen.dart';
import 'app_bar.dart';
import 'boom_menu.dart';
import 'two_board.dart';
import 'home_button.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Welcome'),
      floatingActionButton: SwiftBoomMenu(),
      body: Container(
        width: double.infinity,
        color: Color(0xFF293241),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image(
                    image: AssetImage('images/bird.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Text(
                    'SwiftChat',
                    style: GoogleFonts.chelseaMarket(
                      textStyle: TextStyle(
                        color: Color(0xFFcfdbd5),
                        fontSize: 65.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Color(0xFFcfdbd5),
            //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       onPressed: () {},
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Saved Boards',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
            HomeButton('QuickBoard', TwoBoard.id, Color(0xFFe8eddf)),
            HomeButton('Saved Boards', HomeScreen.id, Color(0xFFe8eddf)),
          ],
        ),
      ),
      // access your saved boards!
      // make a new board!
    );
  }
}
