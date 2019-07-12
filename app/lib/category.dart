import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  List data;
  Category({Key key, this.data}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              new Card(child: Text("Hello"))),
    );
  }
}
