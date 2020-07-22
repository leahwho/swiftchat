import 'package:flutter/material.dart';
import 'package:swift_chat/about.dart';
import 'package:swift_chat/login_screen.dart';
import 'package:swift_chat/search.dart';
import 'package:swift_chat/signin_screen.dart';

import 'home_screen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'two_board.dart';
import 'three_board.dart';
import 'four_board.dart';
import 'choice_screen.dart';
import 'saved_boards.dart';
import 'about.dart';

void main() {
  runApp(SwiftChat());
}

class SwiftChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        TwoBoard.id: (context) => TwoBoard(),
        ThreeBoard.id: (context) => ThreeBoard(),
        FourBoard.id: (context) => FourBoard(),
        SwiftSearch.id: (context) => SwiftSearch(),
        ChoiceScreen.id: (context) => ChoiceScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        SavedBoards.id: (context) => SavedBoards(),
        AboutScreen.id: (context) => AboutScreen(),
        SigninScreen.id: (context) => SigninScreen(),
      },
    );
  }
}
