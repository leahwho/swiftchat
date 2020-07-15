import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';
import 'data.dart';

class BoardButton extends StatefulWidget {
  @override
  _BoardButtonState createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  String imgUrl;
  String userQuery;
  bool displayToggle = false;
  // bool editable = true;

  void updateCard(dynamic searchResults) {
    if (searchResults == null) {
      print('your search results are null! ugh!');
    } else {
      imgUrl = searchResults['imgUrl'];
      userQuery = searchResults['userQuery'];
      setState(() {
        displayToggle = true;
        print(imgUrl);
        print(userQuery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color(0xFFCfDBD5),
          margin: EdgeInsets.all(2.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: GestureDetector(
                      onTap: () {
                        print('Image was clicked!');
                        
                        Data data =
                                new Data(imgUrl: imgUrl, userQuery: userQuery);
                            Navigator.pushNamed(context, ChoiceScreen.id,
                                arguments: data);
                      },
                      child: Container(
                        height: 260,
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child:
                            displayToggle ? Image.network(imgUrl) : Container(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: displayToggle
                      ? Text(userQuery, style: TextStyle(fontSize: 25.0))
                      : Text(''),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    print('Clear was pressed!');
                    setState(() {
                      displayToggle = false;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    print('search was pressed');
                    var searchResults =
                        await Navigator.pushNamed(context, SwiftSearch.id);
                    updateCard(searchResults);
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

// return Expanded(
//       child: GestureDetector(
//         // speed dial will have: search, edit text, clear
//         onLongPress: () async {
//           print('Button pressed!');
//           var searchResults =
//               await Navigator.pushNamed(context, SwiftSearch.id);
//           updateCard(searchResults);
//         },
//         onTap: () {
//           Navigator.pushNamed(context, ChoiceScreen.id);
//         }, // move to image
//         child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             color: Color(0xFFCfDBD5),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 child: Center(
//                   child: Container(
//                     margin: EdgeInsets.all(10.0),
//                     color: Color(0xFFCfDBD5),
//                     child: displayToggle
//                         ? Image.network(imgUrl)
//                         : Container(),
//                   ),
//                 ),
//               ),
//               SwiftCircularMenu(),
//               // displayToggle
//               //     ? Padding(
//               //         padding: const EdgeInsets.only(bottom: 10.0),
//               //         child: TextField(
//               //           style: TextStyle(
//               //             fontSize: 30.0,
//               //           ),
//               //           decoration: InputDecoration(
//               //             prefixIcon: Icon(
//               //               Icons.edit,
//               //               color: Colors.black,
//               //               size: 20.0,
//               //             ),
//               //             border: InputBorder.none,
//               //             hintText: userQuery,
//               //             hintStyle: TextStyle(
//               //               fontSize: 30.0,
//               //               color: Colors.black,
//               //             ),
//               //           ),
//               //         ),
//               //       )
//               //     : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
