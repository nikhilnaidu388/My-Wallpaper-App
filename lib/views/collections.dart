import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

import 'image_view.dart';

class Collections extends StatefulWidget {
  Collections({this.picUrl = ""});
  final String picUrl;
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  List<WallpaperModel> myList = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1 / 1.5,
          //mainAxisExtent: 300
        ),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageFullView(
                              imgUrl: myList[index].src.portrait)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    myList[index].src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
