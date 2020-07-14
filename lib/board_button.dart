import 'package:flutter/material.dart';
import 'choice_screen.dart';
import 'search.dart';


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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xFFCfDBD5),
          ),
          margin: EdgeInsets.all(2.0),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              displayToggle
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChoiceScreen.id);
                      },
                      child: Center(
                        child: Container(
                          child: Image.network(imgUrl),
                        ),
                      ),
                    )
                  : Container(),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  // TODO: Figure out how to display text
                  // displayToggle ? Text(userQuery) : Text(''),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      print('Button pressed!');
                      var searchResults =
                          await Navigator.pushNamed(context, SwiftSearch.id);
                      updateCard(searchResults);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        displayToggle = false;
                        imgUrl = '';
                      });
                    },
                  ),
                ],
              )
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
