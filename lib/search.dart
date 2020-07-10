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

  Future<void> getSearchResults(userQuery) async {
    String url =
        'https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=$userQuery&count=30';

    http.Response response = await http.get(url, headers: {
      'Ocp-Apim-Subscription-Key': '$azureKey'
    });

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
                    itemCount: data == null ? 0 : data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
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

