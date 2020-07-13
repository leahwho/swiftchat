// packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_chat/login_screen.dart';
import 'package:swift_chat/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

// screens & components
import 'home_button.dart';
import 'boom_menu.dart';
// TODO: Do you need these?
import 'bottom_nav_bar.dart';
import 'app_bar.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      // then you can display saved boards?
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (error) {
      print(error);
    }
  }

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
            SizedBox(
              height: 30.0,
            ),
            HomeButton(
              'Login',
              LoginScreen.id,
              Icons.account_circle,
            ),
            HomeButton(
              'Register',
              RegistrationScreen.id,
              Icons.person_add,
            ),
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
