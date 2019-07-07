import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    ));

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  // AppBar logo image asset
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Latest',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.only(right: 5.0),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://getwallpapers.com/wallpaper/full/5/e/1/674609.jpg",
                        fit: BoxFit.cover,
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, int val) {
              return Container(
                margin: EdgeInsets.all(5.0),
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: new Text(
                        "Category $val",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              );
            },
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
