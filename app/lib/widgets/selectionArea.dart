import 'package:flutter/material.dart';
import 'dart:convert';

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
    this.filterData(widget.collection);
    debugPrint(data.toString());
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
                                fontSize: 20,
                                fontFamily: "Righteous",
                                color: Colors.white),
                          )),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.5),
                      padding: EdgeInsets.only(top: 50.0),
                      itemCount: widget.collection.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Card(
                          child: new Image(
                            image: NetworkImage(widget.collection[index]["link"]),
                            fit: BoxFit.cover,
                          )
                        );
                      },
                    )
                  ]),
            ),
          )),
    );
  }
}
