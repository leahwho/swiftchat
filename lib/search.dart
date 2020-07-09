import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // this names the import http

class SwiftSearch extends StatefulWidget {
  @override
  _SwiftSearchState createState() => _SwiftSearchState();
}

class _SwiftSearchState extends State<SwiftSearch> {
  String imageAddress;
  bool displayImages = false;

  Future<void> getResults(query) async {
    String imgThumbnail;

    try {
      http.Response response = await http.get(
          'https://www.googleapis.com/customsearch/v1?key=AIzaSyA0KRsDb701uyxrEM_y1HqblO1dyatyh-U&cx=010969644493142160731:fdiwgadkj5k&q=$query');

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
                  onSubmitted: (value) {
                    getResults(value);
                  },
                ),
              ),
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



