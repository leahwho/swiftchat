import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // this names the import http

import 'dart:convert';

import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'src.dart';

class SwiftSearch extends StatefulWidget {
  @override
  _SwiftSearchState createState() => _SwiftSearchState();
}

class _SwiftSearchState extends State<SwiftSearch> {
  String userQuery;
  Map data;
  String imageAddress;
  bool displayImages = false;

  Future<void> getResults(userQuery) async {
    String imgThumbnail;

    try {
      http.Response response = await http.get(
          'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$cseId=$userQuery');

      if (response.statusCode == 200) {
        var data = response.body;
        imgThumbnail = (jsonDecode(data)['items'][0]['pagemap']['cse_thumbnail']
            [0]['src']);
        print(imgThumbnail);
        setState(() {
          displayImages = true;
        });
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }

    imageAddress = imgThumbnail;
  }

  Future<void> getSearchResults(userQuery) async {
    String url =
        'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$cseId=$userQuery';

    http.Response response = await http.get(url);

    this.setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftAppBar('Search'),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Enter Search Query',
                  ),
                  onSubmitted: (query) {
                    getSearchResults(query);
                    //getResults(query);
                  },
                  onChanged: (query) {
                    setState(() {
                      displayImages = false;
                      userQuery = query;
                    });
                  },
                ),
              ),
              Container(
                child: GridView.builder(
                  itemCount: data == null ? 0 : data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                          child: Image.network(
                              '${data['items'][index]['pagemap']['cse_thumbnail'][0]['src']}')),
                    );
                  },
                  shrinkWrap: true,
                ),
              ),
              // FutureBuilder(
              //   future: getSearchResults(query),
              //   builder: (context, snapShot) {
              //   if (snapShot.hasError) {
              //     return Text('Error! Ack! No images for you!');
              //   } else if (snapShot.hasData) {
              //     return Text('YOU HAVE DATA!');
              //   }
              // }),
              displayImages
                  ? Card(child: Image.network(imageAddress))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

// return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3),

//                       itemBuilder: (BuildContext context, int index) {
//                         return Container();
//                       });

// FutureBuilder(
//                 future: getSearchResults(),
//                 builder: (context, snapShot) {
//                   Map data = snapShot.data;
//                   if(snapShot.hasError) {
//                     print(snapShot.error);
//                     return Text('Failed to get response with this error: ${snapShot.error}')
//                   } else if (snapShot.hasData) {
//                     return new Center(
//                       child: GridView.count(
//                         crossAxisCount: 3,
//                         children: List.generate(30, (index) {
//                           return Center(
//                             child: Image.network('${data['items'][index]['pagemap']['cse_thumbnail']
//                               [0]['src']}'),
//                             );
//                           }
//                         ),
//                         )
//                     );
//                   } else if (!snapShot.hasData){
//                     return Center(child: CircularProgressIndicator());
//                   }
//                 }
//                 ),
