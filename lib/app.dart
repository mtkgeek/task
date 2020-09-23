import 'package:flutter/material.dart';
import 'package:task/posts/posts.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "A3kaPm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF6B9949),
                size: 20.0,
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                  )),
            ],
          ),
          body: PostsPage(),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.explore),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.school),
                  onPressed: () {},
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {},
                  iconSize: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
