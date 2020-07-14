import 'package:flutter/material.dart';
import 'package:swift_chat/login_screen.dart';
import 'package:swift_chat/search.dart';
import 'quick_board.dart';
import 'home_screen.dart';
import 'choice_screen.dart';
import 'three_board.dart';
import 'four_board.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(SwiftChat());
}

class SwiftChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        TwoBoard.id: (context) => TwoBoard(),
        ThreeBoard.id: (context) => ThreeBoard(),
        FourBoard.id: (context) => FourBoard(),
        SwiftSearch.id: (context) => SwiftSearch(),
        ChoiceScreen.id: (context) => ChoiceScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        // '/saved' => (context) => SavedBoards(),
      },
    );
  }
}
