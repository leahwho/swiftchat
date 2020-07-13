import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  String route;
  String buttonText;
  IconData icon;

  HomeButton(
    this.buttonText,
    this.route,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: Color(0xFFcfdbd5),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () async {
            Navigator.pushNamed(context, route);
          },
          minWidth: 250.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
