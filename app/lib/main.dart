import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/appBackground.dart';
import 'widgets/wallpaperCard.dart';

void main() => runApp(new MaterialApp(
      title: "SOFT-AI Wallpaper",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image:
                  AssetImage("assets/Colorful-App-Tiles-Android-Wallpaper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          WallpaperCard()
        ]),
      ),
    );
  }
}
