import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'data.dart';

class ChoiceScreen extends StatefulWidget {
  static String id = 'choice_screen';

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  Data data;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    data = settings.arguments;
    String choice = this.data.userQuery;

    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Choice!'),
      bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: 400,
            width: double.infinity,
            child: Card(
              color: Color(0xFFCfDBD5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        this.data.imgUrl,
                        height: 310,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      choice.sentenceCase,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension CapExtension on String {
  String get sentenceCase => '${this[0].toUpperCase()}${this.substring(1)}';
}
