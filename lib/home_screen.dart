import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: make an appbar widget class
      appBar: AppBar(
        title: Text('SwiftChat'),
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBar: BottomNavBar(),
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

            // TODO: Make a homeScreenButton widget class
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
                onPressed: () {
                  print('login button pressed!');
                },
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
                onPressed: () {
                  print('register button pressed!');
                }, // TODO: Add function! --> this button should go to the 'resgister' route
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
