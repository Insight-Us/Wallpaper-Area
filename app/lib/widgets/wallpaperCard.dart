import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'selectionArea.dart';

class WallpaperCard extends StatefulWidget {
  @override
  _WallpaperCardState createState() => _WallpaperCardState();
}

class _WallpaperCardState extends State<WallpaperCard>
    with SingleTickerProviderStateMixin {
  final String url = "https://vivrti.pythonanywhere.com/api/";
  final String urlCategory = "https://vivrti.pythonanywhere.com/category/";
  List data;
  List Category;
  int count;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    final response =
        await http.get(url, headers: {"Accept": "application/json"});
    final categoryResponse =
        await http.get(urlCategory, headers: {"Accept": "application/json"});

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      var categoryJSON = jsonDecode(categoryResponse.body);
      Category = categoryJSON["results"];
      data = convertDataToJson['results'];
      data = data.reversed.toList();
      //print(data);
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJsonData(),
      builder: (BuildContext ctx, AsyncSnapshot snap) => data == null
          ? Align(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator())
          : ListView.builder(
              itemCount: Category.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SelectionArea(
                                    categorySelected: Category[index]
                                        ["category_name"],
                                    url: Category[index]["cover_page"],
                                    collection: data,
                                    id: Category[index]["id"],
                                  )));
                    },
                    child: SizedBox(
                      height: 100,
                      child: Hero(
                        tag: Category[index]["category_name"].toString(),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 3.0,
                          color: Colors.black,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              fit: StackFit.expand,
                              children: [
                                new Image.network(
                                  Category[index]["cover_page"].toString(),
                                  fit: BoxFit.cover,
                                  color: Colors.black45,
                                  colorBlendMode: BlendMode.darken,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: new Text(
                                        Category[index]["category_name"],
                                        style: TextStyle(
                                          fontFamily: "Kaushan",
                                          color: Colors.white,
                                          fontSize: 30.0,
                                        ),
                                      )),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
