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
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/$route');
        },
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        color: Color(0xFFe8eddf),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
