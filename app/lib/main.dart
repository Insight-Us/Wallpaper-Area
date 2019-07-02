import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Arena',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wallpaper Arena'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  _MyHomePageState({this.data});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: new Row(children: <Widget>[
              Expanded(child: new Text("Game")),
              Expanded(child: new Text("Movie")),
              Expanded(child: new Text("Anime")),
              Expanded(child: new Text("Sports")),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              
            ],
          )
        ],
      ), 
    );
  }
}
