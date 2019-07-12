import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'widgets/appBackground.dart';
import 'widgets/wallpaperCard.dart';

void main() => runApp(new MaterialApp(
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
    return Scaffold(
      appBar: AppBar(
        
        title: new Text("SOFT-AI Wallpaper", style: TextStyle(color: Colors.white, fontFamily: 'Righteous', fontSize: 30),),
        backgroundColor: Colors.pink[700],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Stack(children: [AppBackground(), WallpaperCard()]),
    );
  }
}
