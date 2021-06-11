import 'package:flutter/material.dart';

class ImageFullView extends StatefulWidget {
  late final String imgUrl;
  ImageFullView({required this.imgUrl});

  @override
  _ImageFullViewState createState() => _ImageFullViewState();
}

class _ImageFullViewState extends State<ImageFullView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.amber, style: BorderStyle.solid),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF)
                            ])),
                        child: Column(
                          children: [
                            Text(
                              "Set As Wallpaper",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("Save Image In Gallery",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
