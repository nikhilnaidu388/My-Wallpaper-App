import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/mydata/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/mywidgets/widget.dart';

class Category extends StatefulWidget {
  late final String categoryName;
  Category({this.categoryName = ""});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
    getSearchWallpapers(widget.categoryName);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            wallpaperWidget(wallpaperList, context),
          ],
        ),
      ),
    );
  }
}
