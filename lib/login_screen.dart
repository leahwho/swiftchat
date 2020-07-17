import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftAppBar('Login'),
      // bottomNavigationBar: BottomNavBar(),
      backgroundColor: Color(0xFF293241),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          width: double.infinity,
          color: Color(0xFF293241),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image(
                      image: AssetImage('images/bird.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
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
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Color(0xFFe8eddf),
                    filled: true,
                    hintText: 'Enter your email.',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF333533), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF333533), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Color(0xFFe8eddf),
                    filled: true,
                    hintText: 'Enter your password.',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF333533), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF333533), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Color(0xFFcfdbd5),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (error) {
                        print(error);
                        //TODO: Save and put into a widget!
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: SwiftBoomMenu(),
    );
  }
}
