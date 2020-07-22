import 'package:flutter/material.dart';
import 'package:swift_chat/app_bar.dart';
import 'package:swift_chat/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static String id = 'about_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('All About SwiftChat'),
      bottomNavigationBar: BottomNavBar(),
      // floatingActionButton: SwiftBoomMenu(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image(
                    image: AssetImage('images/bird.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 5.0,
                  ),
                  child: Text(
                    'SwiftChat',
                    style: GoogleFonts.chelseaMarket(
                      textStyle: TextStyle(
                        color: Color(0xFFcfdbd5),
                        fontSize: 65.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20.0,
            ),
            child: Card(
              color: Color(0xFFcfdbd5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/flutterlogo.png'),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          backgroundImage:
                              AssetImage('images/firebaselogo.png'),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          backgroundImage: AssetImage('images/circlebing.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'SwiftChat was created by me, Leah Hughes, as my final capstone project for Ada Developers Academy.  It is inspired by my background as a special education teacher working with students with severe disabilities.  Before joining Ada, I always wanted this app so I could quickly and easily make communication boards to use with my nonverbal students.  SwiftChat is intended to be used by teachers of and families with students that are visual communicators.  This project was built using Flutter, Firebase, and the Bing Image Search API.',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20.0,
            ),
            child: Card(
              color: Color(0xFFcfdbd5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/colosseum.png'),
                        ),
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/dinograbber.jpg'),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          backgroundImage: AssetImage('images/bluesaw.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Thanks to the Genius Level Ideas crew in FlutterCaps! Y\'all kept me laughing and sane.  Thanks to our Project Manager, Jared, for letting us take the lead most of the time.  Thanks to Katie for all the love and support.  And no thanks to Apple. 😆',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20.0,
            ),
            child: Card(
              color: Color(0xFFcfdbd5),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://i.imgur.com/AQR96do.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () => launch(
                                'https://www.linkedin.com/in/leahwhughes/'),
                            child: Container(
                              width: 150,
                              child: Image.asset('images/linkedin.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20.0,
            ),
            child: Card(
              color: Color(0xFFcfdbd5),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () => launch(
                                'https://adadevelopersacademy.org/'),
                            child: Container(
                              width: 150,
                              child: Image.asset('images/ada_horiz_logo.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
