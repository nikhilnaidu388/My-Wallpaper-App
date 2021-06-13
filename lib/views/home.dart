import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/mydata/data.dart';
import 'package:wallpaper_app/mywidgets/widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/views/category.dart';
import 'package:wallpaper_app/views/collections.dart';
import 'package:wallpaper_app/views/search.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  var currPage = [Home(), Collections()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collections',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> mylist = [];
  List<WallpaperModel> wallpaperList = [];

  TextEditingController searchController = TextEditingController();

  getTrendingWallpapers() async {
    var url = Uri.parse("http://api.pexels.com/v1/curated?per_page=10");
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
    getTrendingWallpapers();
    mylist = getCategories();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: Column(
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
                    controller: searchController,
                    decoration: InputDecoration(
                      //labelText: "search",
                      hintText: "search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(
                                    searchQuery: searchController.text,
                                  )));
                    },
                    child: Container(child: Icon(Icons.search))),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 60,
            child: ListView.builder(
              itemCount: mylist.length,
              shrinkWrap: true,
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
          Expanded(child: wallpaperWidget(wallpaperList, context)),
          //BottomNavigation(),
        ],
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      categoryName: title.toLowerCase(),
                    )));
      },
      child: Container(
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
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  var currTab = [Home(), Collections()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currTab[_currentIndex],
      bottomNavigationBar: newMethod1(),
    );
  }

  BottomNavigationBar newMethod1() {
    return BottomNavigationBar(
      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          label: 'Collections',
        ),
      ],
    );
  }
}
