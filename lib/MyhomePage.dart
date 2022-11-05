import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:tyba_prueba/DetailData.dart';
import 'package:tyba_prueba/WidgetArguments.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  final url =
      'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json';

  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange[800],
              title: const Text("Universidades"),
              actions: [
                IconButton(
                  icon: Icon(_viewType == ViewType.list
                      ? Icons.grid_on
                      : Icons.view_list),
                  onPressed: () {
                    if (_viewType == ViewType.list) {
                      _crossAxisCount = 2;
                      _aspectRatio = 1.5;
                      _viewType = ViewType.grid;
                    } else {
                      _crossAxisCount = 1;
                      _aspectRatio = 5;
                      _viewType = ViewType.list;
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            body: Container(
                margin: const EdgeInsets.all(10),
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: _crossAxisCount,
                      childAspectRatio: _aspectRatio,
                      children: _postsJson.map((i) {
                        return getGridItem(i);
                      }).toList(),
                    )))));
  }

  GridTile getGridItem(post) {
    return GridTile(
      child: (_viewType == ViewType.list)
          ? Container(
              margin: const EdgeInsets.all(5),
              color: Colors.deepOrange[100],
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detailPage',
                              arguments: WidgetArguments(
                                  post["name"],
                                  post["country"],
                                  post["province"] ?? "No hay información",
                                  post['web_pages'][0] ??
                                      "No hay información"));
                        },
                        child: Text(
                          post["name"],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detailPage',
                        arguments: WidgetArguments(
                            post["name"],
                            post["country"],
                            post["province"] ?? "No hay información",
                            post['web_pages'][0] ?? "No hay información"));
                  },
                  child: Container(
                    width: 170,
                    height: 100,
                    padding: const EdgeInsets.all(24.0),
                    color: Colors.deepOrange[100],
                    child: Text(
                      post["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

enum ViewType { grid, list }
