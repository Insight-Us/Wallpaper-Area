import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

