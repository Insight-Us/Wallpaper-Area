import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(

              child: new RichText(
            text: TextSpan(children: [TextSpan(text: 'C', style: TextStyle(fontSize: 40.0)), TextSpan(text: 'ategory', style: TextStyle(fontSize: 30.0)), ]),
          )),
          backgroundColor: Colors.pink[700].withOpacity(1.0),
        ),
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
          /*Align(
            alignment: Alignment.topCenter,
            child: new RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "C",
                    style: TextStyle(fontSize: 45.0, fontFamily: "Ubuntu")),
                TextSpan(
                    text: "ategories",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.normal
                    ))
              ]),
            ),
          ),*/
          WallpaperCard()
        ]),
      ),
    );
  }
}
