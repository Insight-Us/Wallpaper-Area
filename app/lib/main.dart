import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:wallpaper/wallpaper.dart' as wall;
import 'category.dart';

void main() => runApp(new MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    ));

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  final String url = "https://vivrti.pythonanywhere.com/api/";
  List data;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.getJsonData();
    });

    _wallpaperAnimationController = AnimationController(vsync: this, )
  }

  /*
    Animation controller
  */

  Animation _wallpaperAnimation;
  AnimationController _wallpaperAnimationController;

  Future<String> getJsonData() async {
    // final response = await http.get('https://jsonplaceholder.typicode.com/posts/');
    final response =
        await http.get(url, headers: {"Accept": "application/json"});

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['results'];
      data = data.reversed.toList();
    });
    return "Success";
  }

  // AppBar logo image assets
  Widget getImageAsset() {
    AssetImage image = AssetImage('assets/logo.png');
    Image img = Image(
      image: image,
      width: 30,
      height: 30,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(child: img),
    );
  }

  Widget latestView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Latest',
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: 'Schyler'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder(
            future: getJsonData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: Container(child: new CircularProgressIndicator()));
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 100,
                          child: InkWell(
                            onTap: () {
                              debugPrint("Pressed $index");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          wallpaper(url: data[index]['link'])));
                            },
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    child: Image.network(
                                      data[index]["link"],
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.transparent),
                        ));
              }
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: 'Schyler'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        new Container(
          child: new Category(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("SOFT-AI Wallpaper"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: getImageAsset(),
      ),
      body: latestView(),
      backgroundColor: Color(0x1F221010),
    );
  }
}

class wallpaper extends StatefulWidget {
  String url = "";
  wallpaper({Key key, this.url}) : super(key: key);

  @override
  _wallpaperState createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> with TickerProviderStateMixin {
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
                    "Set as wallpaper",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await wall.Wallpaper.homeScreen(widget.url);
                    // Read documentation of https://pub.dev/packages/wallpaper#-readme-tab-
                  })),
        ],
      ),
    );
  }
}
