import 'package:flutter/material.dart';


class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  String imgUrl;
  String userQuery;
  bool displayToggle = false;

  String buttonText = 'EDITABLE TEXT HERE';

  void updateCard(dynamic searchResults) {
    if (searchResults == null) {
      print('the results are NULL, idiot');
    } else {
      imgUrl = searchResults['imgUrl'];
      userQuery = searchResults['userQuery'];
      setState(() {
        displayToggle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          print('Button pressed!');
          var searchResults = await Navigator.pushNamed(context, '/search');
          // use a function to pass searchResults and then update the query and imgUrl
          // print(searchResults);
          updateCard(searchResults);
        },
        // onPressed: () async {
        //               var weatherData = await weather.getLocationWeather();
        //               updateUI(weatherData);
        //             },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.grey.shade100,
                  child: Center(
                    child: displayToggle
                        ? Image.network(imgUrl)
                        : Text(
                            'TAP TO ADD IMAGE',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: userQuery ?? buttonText,
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
