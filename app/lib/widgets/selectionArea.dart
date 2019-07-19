import 'package:flutter/material.dart';
import 'package:app/utility/wallpaperSetter.dart';
import 'package:flutter/services.dart';

class SelectionArea extends StatefulWidget {
  String categorySelected;
  String url;
  List<dynamic> collection;
  int id;

  SelectionArea(
      {Key key, this.categorySelected, this.url, this.collection, this.id})
      : super(key: key);

  @override
  _SelectionAreaState createState() => _SelectionAreaState();
}

class _SelectionAreaState extends State<SelectionArea> {
  //Map<String, dynamic> data = new Map();
  List data = new List();
  @override
  void initState() {
    super.initState();
    data == null
        ? print("Data is not null")
        : setState(() {
            filterData(widget.collection);
          });
    //print(data.toString());
  }

  filterData(List<dynamic> links) {
    for (var i in links) {
      //debugPrint(i.toString());
      if (i["category"] == widget.id) {
        data.add(i["link"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
          transitionOnUserGestures: false,
          tag: widget.categorySelected,
          child: Align(
            alignment: Alignment.center,
            child: new Card(
              clipBehavior: Clip.antiAlias,
              elevation: 4.0,
              child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.expand,
                  children: [
                    new Image.network(
                      widget.url,
                      fit: BoxFit.cover,
                      color: Colors.black45,
                      colorBlendMode: BlendMode.darken,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: new Text(
                            widget.categorySelected,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Kaushan",
                                color: Colors.white),
                          )),
                    ),
                    Container(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.5),
                        padding: EdgeInsets.only(top: 70.0),
                        itemCount: data.length,
                        cacheExtent: 3.0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          WallpaperSetter(url: data[index])));
                            },
                            child: Card(
                              color: Colors.black,
                              elevation: 3.0,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: FadeInImage(
                                image: NetworkImage(data[index]),
                                placeholder: AssetImage('assets/loading.gif'),
                                fit: BoxFit.cover,
                                fadeInCurve: Curves.slowMiddle,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
