import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // this names the import http

import 'dart:convert';

import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'src.dart';

class SwiftSearch extends StatefulWidget {
  static String id = 'search_screen';
  @override
  _SwiftSearchState createState() => _SwiftSearchState();
}

class _SwiftSearchState extends State<SwiftSearch> {
  Map data;
  String userQuery;
  String imageAddress;
  bool displayImages = false;

  Future<void> getSearchResults(userQuery) async {
    String url =
        'https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=$userQuery&count=30';

    http.Response response = await http
        .get(url, headers: {'Ocp-Apim-Subscription-Key': '$azureKey'});

    this.setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      appBar: SwiftAppBar('Search'),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Enter Search Query',
                    
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onSubmitted: (query) {
                    getSearchResults(query);
                    setState(() {
                      displayImages = true;
                    });
                  },
                  onChanged: (query) {
                    setState(() {
                      displayImages = false;
                      userQuery = query;
                    });
                  },
                ),
              ),
              displayImages
                  ? GridView.builder(
                      itemCount: data == null ? 0 : 30,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(
                                context,
                                {
                                  'userQuery': userQuery,
                                  'imgUrl':
                                      '${data['value'][index]['thumbnailUrl']}'
                                },
                              );
                            },
                            child: Image.network(
                                '${data['value'][index]['thumbnailUrl']}'),
                          ),
                        );
                      },
                      shrinkWrap: true,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
