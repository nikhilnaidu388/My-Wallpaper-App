import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/mydata/data.dart';
import 'package:wallpaper_app/mywidgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  late final String searchQuery;
  Search({this.searchQuery = ""});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpaperList = [];
  getSearchWallpapers(String query) async {
    var url = Uri.parse("https://api.pexels.com/v1/search?query=$query");
    var response = await http.get(url, headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    jsonMap["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperobj;
      wallpaperobj = WallpaperModel.fromMap(element);
      wallpaperList.add(wallpaperobj);
      setState(() {});
    });
  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          centerTitle: true,
          title: brandName(),
          elevation: 0,
        ),
        body: wallpaperWidget(wallpaperList, context)
        // SingleChildScrollView(
        //   child: Container(
        //       child: Column(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //             color: Colors.grey[100],
        //             borderRadius: BorderRadius.circular(30)),
        //         margin: EdgeInsets.symmetric(horizontal: 24),
        //         padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: TextField(
        //                 controller: searchController,
        //                 decoration: InputDecoration(
        //                     hintText: "search", border: InputBorder.none),
        //               ),
        //             ),
        //             InkWell(
        //                 onTap: () {
        //                   getSearchWallpapers(searchController.text);
        //                 },
        //                 child: Container(child: Icon(Icons.search))),
        //           ],
        //         ),
        //       ),
        //       wallpaperWidget(wallpaperList, context),
        //     ],
        //   )),
        // )
        );
  }
}
