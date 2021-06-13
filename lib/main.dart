import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wallpaper Hub",
      theme: ThemeData(primaryColor: Colors.white),
      home: FirstPage(),
    );
  }
}
