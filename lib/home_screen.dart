// packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_chat/bottom_nav_bar.dart';

// screens & components
import 'home_button.dart';
import 'boom_menu.dart';
import 'two_board.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'saved_boards.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  bool userLoggedIn = false;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      // then you can display saved boards?
      if (user != null) {
        loggedInUser = user;
        setState(() {
          userLoggedIn = true;
        });
        print('${loggedInUser.email} is logged in');
        return;
      }
    } catch (error) {
      print(error);
    }
    print('there is no user logged in');
  }

  void logout() async {
    await _auth.signOut();
    setState(() {
      userLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
              buttonText: 'QuickBoard',
              route: TwoBoard.id,
              color: Color(0xFFe8eddf),
            ),
            userLoggedIn
                ? HomeButton(
                    buttonText: 'Saved Boards',
                    route: SavedBoards.id,
                    color: Color(0xFFe8eddf),
                  )
                : SizedBox(
                    height: 0,
                  ),
            userLoggedIn
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Material(
                      color: Color(0xFFcfdbd5),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          logout();
                        },
                        minWidth: 250.0,
                        height: 42.0,
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  )
                : HomeButton(
                    buttonText: 'Login',
                    route: LoginScreen.id,
                    color: Color(0xFFcfdbd5),
                  ),
            userLoggedIn
                ? SizedBox(height: 0)
                : HomeButton(
                    buttonText: 'Register',
                    route: RegistrationScreen.id,
                    color: Color(0xFFcfdbd5),
                  ),
          ],
        ),
      ),
      floatingActionButton: SwiftBoomMenu(),
    );
  }
}
