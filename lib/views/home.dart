import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/mydata/data.dart';
import 'package:wallpaper_app/mywidgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> mylist = [];
  List<WallpaperModel> wallpaperList = [];

  getTrendingWallpapers() async {
    var url = Uri.parse("http://api.pexels.com/v1/curated?per_page=1");
    var response = await http.get(url, headers: {"Authorization": apiKey});
    // print(response.statusCode);
    // print(response.body.toString());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    jsonMap["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperobj;
      wallpaperobj = WallpaperModel.fromMap(element);
      wallpaperList.add(wallpaperobj);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpapers();
    mylist = getCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "search", border: InputBorder.none),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  itemCount: mylist.length,
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                        imgUrl: mylist[index].imgUrl,
                        title: mylist[index].categoryName);
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  height: 80, child: wallpaperWidget(wallpaperList, context)),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, title;
  CategoryTile({required this.imgUrl, required this.title});
  //const CategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 1, 0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgUrl,
              width: 100,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(10)),
            height: 60,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
