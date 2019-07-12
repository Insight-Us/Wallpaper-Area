
import 'package:WallpaperSetter/WallpaperSetter.dart' as wall;
import 'package:flutter/material.dart';

class WallpaperSetter extends StatefulWidget {
  String url = "";
  WallpaperSetter({Key key, this.url}) : super(key: key);

  @override
  _WallpaperSetterState createState() => _WallpaperSetterState();
}

class _WallpaperSetterState extends State<WallpaperSetter> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              widget.url,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                  color: Colors.black87,
                  splashColor: Colors.white,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.3,
                      right: MediaQuery.of(context).size.width * 0.3),
                  elevation: 2.0,
                  child: new Text(
                    "Set as WallpaperSetter",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await wall.WallpaperSetter.homeScreen(widget.url);
                    // Read documentation of https://pub.dev/packages/WallpaperSetter#-readme-tab-
                  })),
        ],
      ),
    );
  }
}
