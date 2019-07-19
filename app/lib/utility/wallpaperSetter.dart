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

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FadeInImage(
              image: NetworkImage(
                widget.url,
                
              ),
              fit: BoxFit.cover,
              placeholder: AssetImage("assets/loading.gif"),
            ),
            color: Colors.black,
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text("Set as wallpaper"),
        backgroundColor: Colors.blueGrey,
        clipBehavior: Clip.antiAlias,
        elevation: 12.0,
        isExtended: true,
        icon: Icon(Icons.phone_android),
        onPressed: () async {
          await wall.Wallpaper.homeScreen(widget.url);
          key.currentState.showSnackBar(SnackBar(content: new Text("Setting up wallpaper"),));
        },
      ),
    );
  }
}