import 'package:flutter/material.dart';
import 'package:swift_chat/search.dart';
import 'quick_board.dart';
import 'home_screen.dart';
import 'choice_screen.dart';
import 'three_board.dart';
import 'four_board.dart';

void main() {
  runApp(SwiftChat());
}

class SwiftChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quickboard': (context) => QuickBoard(),
        '/search': (context) => SwiftSearch(),
        '/choice_screen': (context) => ChoiceScreen(),
        '/threeboard': (context) => ThreeBoard(),
        '/fourboard': (context) => FourBoard(),
        // '/saved' => (context) => SavedBoards(),
      },
    );
  }
}
