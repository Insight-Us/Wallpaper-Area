import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() => runApp(new MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    ));

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final String url = "https://vivrti.pythonanywhere.com/api/";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
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

    debugPrint(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['results'];
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
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.only(right: 5.0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: InkWell(
                      onTap: () {
                        debugPrint("Pressed $index");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Wallpaper(url: data[index]['link'])));
                      },
                      child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Image.network(
                            data[index]['link'],
                            fit: BoxFit.cover,
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                  )),
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
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 2.0,
            children: <Widget>[
              new Container(
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Center(child: new Text("Category 1")),
              ),
            ],
          ),
        ),
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

// Second screen
class Wallpaper extends StatelessWidget {
  String url = "";
  Wallpaper({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FittedBox(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          url,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
