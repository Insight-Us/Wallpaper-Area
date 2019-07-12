import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wallpaper/wallpaper.dart' as wall;

class WallpaperSetter extends StatefulWidget {
  String url = "";
  WallpaperSetter({Key key, this.url}) : super(key: key);

  @override
  _WallpaperSetterState createState() => _WallpaperSetterState();
}

class _WallpaperSetterState extends State<WallpaperSetter>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            child: Image.network(
              widget.url,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text("Set as wallpaper"),
        backgroundColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        elevation: 12.0,
        isExtended: true,
        icon: Icon(Icons.phone_android),
        onPressed: () async {
          await wall.Wallpaper.homeScreen(widget.url);
          // Read documentation of https://pub.dev/packages/WallpaperSetter#-readme-tab-
        },
      ),
    );
  }
}
