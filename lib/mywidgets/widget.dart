import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/collections.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 28),
      children: <TextSpan>[
        TextSpan(
            text: 'Wallpaper',
            style: GoogleFonts.fredokaOne(
              textStyle: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.deepPurpleAccent,
              ),
            )),
        TextSpan(
          text: ' App',
          style: GoogleFonts.fredokaOne(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w100, color: Colors.teal[200])),
        ),
      ],
    ),
  );
}

Widget wallpaperWidget(List<WallpaperModel> wallpaperList, context) {
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
      itemCount: wallpaperList.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            GestureDetector(
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
            ),
            Like(
              picUrl: wallpaperList[index].src.portrait,
            ),
          ],
        );
      });
}

class Like extends StatefulWidget {
  Like({required this.picUrl});
  final String picUrl;

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool liked = false;
  pressed(String picUrl) {
    setState(() {
      liked = !liked;
      if (liked) {
        Collections(picUrl: picUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String picUrl = "";
    return Container(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: Icon(
          liked ? Icons.favorite : Icons.favorite_border,
          color: liked ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          pressed(picUrl.toString());
        },
      ),
    );
  }
}
