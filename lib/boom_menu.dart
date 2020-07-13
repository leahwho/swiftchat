import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'quick_board.dart';
import 'three_board.dart';
import 'four_board.dart';

class SwiftBoomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoomMenu(
      elevation: 5.0,
      backgroundColor: Color(0xFF4a4e69),
      animatedIcon: AnimatedIcons.view_list,
      animatedIconTheme: IconThemeData(
        size: 30.0,
        color: Color(0xFFcfdbd5),
      ),
      //child: Icon(Icons.add),
      // onOpen: () => print('OPENING DIAL'),
      // onClose: () => print('DIAL CLOSED'),
      scrollVisible: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      children: [
        MenuItem(
          child: Icon(
            Icons.looks_two,
            size: 35.0,
            color: Color(0xFF22223b),
          ),
          title: "TwoChoice",
          titleColor: Color(0xFF242423),
          subtitle: "Create a board with two choices",
          subTitleColor: Color(0xFF333533),
          backgroundColor: Color(0xFFcfdbd5),
          onTap: () {
            Navigator.pushNamed(context, TwoBoard.id);
          },
        ),
        MenuItem(
          child: Icon(
            Icons.looks_3,
            size: 35.0,
            color: Color(0xFF22223b),
          ),
          title: "ThreeChoice",
          titleColor: Color(0xFF242423),
          subtitle: "Create a board with three choices",
          subTitleColor: Color(0xFF333533),
          backgroundColor: Color(0xFFcfdbd5),
          onTap: () {
            Navigator.pushNamed(context, ThreeBoard.id);
          },
        ),
        MenuItem(
          child: Icon(
            Icons.looks_4,
            size: 35.0,
            color: Color(0xFF22223b),
          ),
          title: "FourChoice",
          titleColor: Color(0xFF242423),
          subtitle: "Create a board with four choices",
          subTitleColor: Color(0xFF333533),
          backgroundColor: Color(0xFFcfdbd5),
          onTap: () {
            Navigator.pushNamed(context, FourBoard.id);
          },
        ),
        MenuItem(
          child: Icon(
            Icons.save,
            size: 35.0,
            color: Color(0xFF22223b),
          ),
          title: "Saved Boards",
          titleColor: Color(0xFF242423),
          subtitle: "View all saved boards",
          subTitleColor: Color(0xFF333533),
          backgroundColor: Color(0xFFcfdbd5),
          onTap: () => print('FOURTH CHILD'),
        )
      ],
    );
  }
}
