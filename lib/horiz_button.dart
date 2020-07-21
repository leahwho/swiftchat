import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';
import 'data.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HorizButton extends StatefulWidget {
  HorizButton({
    this.id,
    this.imgUrl,
    this.userQuery,
    this.displayToggle,
    this.searchResults,
    this.onClearClick,
  });

  int id;
  String imgUrl;
  String userQuery;
  bool displayToggle;
  Function searchResults;
  Function onClearClick;

  @override
  _HorizButtonState createState() => _HorizButtonState();
}

class _HorizButtonState extends State<HorizButton> {
  String value;
  final FlutterTts _flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future _speak(String text) async {
      await _flutterTts.speak(text);
    }

    Dialog editTextDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFcfdbd5),
            borderRadius: BorderRadius.circular(10.0)),
        height: 200.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (text) {
                  value = text;
                },
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF293241),
                    ),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFe8eddf),
                  hintText: 'Button Text',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Color(0xFF293241),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.userQuery = value;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Update Button Text',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color(0xFFCfDBD5),
          margin: EdgeInsets.all(2.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Container(
                    width: 350.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: GestureDetector(
                          onTap: () async {
                            _speak(widget.userQuery);
                            // here we send the data to the next page
                            Data data = new Data(
                                imgUrl: widget.imgUrl,
                                userQuery: widget.userQuery);
                            Navigator.pushNamed(context, ChoiceScreen.id,
                                arguments: data);
                          },
                          child: Row(
                            children: <Widget>[
                              widget.displayToggle
                                  ? Expanded(
                                      child: Image.network(
                                        widget.imgUrl,
                                      ),
                                    )
                                  : Container(),
                              widget.displayToggle
                                  ? GestureDetector(
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                editTextDialog);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            widget.userQuery,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(''),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    this.widget.onClearClick(widget.id);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    var searchResults =
                        await Navigator.pushNamed(context, SwiftSearch.id);
                    this.widget.searchResults(searchResults, widget.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
