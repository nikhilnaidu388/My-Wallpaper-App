import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}

Widget wallpaperWidget(List<WallpaperModel> wallpaperList, context) {
  return Container(
    //height: 400,
    margin: EdgeInsets.symmetric(vertical: 10),
    height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
    child: GridView.builder(
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1 / 1.5,
          //mainAxisExtent: 300
        ),
        itemCount: wallpaperList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageFullView(
                          imgUrl: wallpaperList[index].src.portrait)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                wallpaperList[index].src.portrait,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
  );
}
