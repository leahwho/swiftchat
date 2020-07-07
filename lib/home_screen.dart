import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('SwiftChat'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),

            Image(
              image: AssetImage(
                'images/DeepPurpleCircleLogo.png',
              ),
            ),

            const SizedBox(height: 50), // invisible

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quickboard');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Quick Board',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: RaisedButton(
                onPressed:
                    () {}, // TODO: Add function! --> this button should go to the 'login' route
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: RaisedButton(
                onPressed:
                    () {}, // TODO: Add function! --> this button should go to the 'resgister' route
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
