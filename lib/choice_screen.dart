import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'horiz_button.dart';
import 'data.dart';

class ChoiceScreen extends StatelessWidget {
  static String id = 'choice_screen';
  Data data;
  // RouteSettings settings = ModalRoute.of(context).settings;
  //   user = settings.arguments;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    data = settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Choice!'),
      bottomNavigationBar: BottomNavBar(),
      body: Card(
        child: Image.network(this.data.imgUrl),
      ),
    );
  }
}
