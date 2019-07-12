import 'package:flutter/material.dart';

class SelectionArea extends StatefulWidget {
  String categorySelected;
  String url;
  List data;

  SelectionArea({Key key, this.categorySelected, this.url, this.data}) : super(key: key);

  @override
  _SelectionAreaState createState() => _SelectionAreaState();
}

class _SelectionAreaState extends State<SelectionArea> {
  @override
  void initState(){
    super.initState();
    debugPrint(widget.data.toString());
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
                        child: new Text(widget.categorySelected, style: TextStyle(fontSize: 20, fontFamily: "Righteous", color: Colors.white),)),
                    ),
                  ]),
            ),
          )),
    );
  }
}
