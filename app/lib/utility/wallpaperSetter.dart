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

  int _selectedNav = 0;

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
              fit: BoxFit.fitWidth,
              placeholder: AssetImage("assets/loader-green.gif"),
            ),
            color: Color(0xFF131313),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_iphone),
            title: new Text("Homescreen"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.screen_lock_portrait), title: new Text("Lockscreen")),
        ],
        onTap: (index) async {
          _selectedNav = index;
          if (index == 0) {
            await wall.Wallpaper.homeScreen(widget.url);
            key.currentState.showSnackBar(SnackBar(
              content: new Text("Setting up wallpaper"),
            ));
          } else if (index == 1) {
            await wall.Wallpaper.lockScreen(widget.url);
            key.currentState.showSnackBar(SnackBar(
              content: new Text("Setting up wallpaper"),
            ));
          }
        },
        currentIndex: _selectedNav,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
