import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/posts/models/post.dart';
import 'package:task/posts/widgets/toolbar.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  PostDetailPage({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("A3kaPm",
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text('${post.body}',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(fontSize: 16.0),
                                )),
                          ),
                          SizedBox(height: 40),
                          Column(
                            children: <Widget>[
                              Divider(height: 2, thickness: 2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10),
                                    child: Text("Y3peHHHHNN A3Cap H1",
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14))),
                                  ),
                                ),
                              ),
                              Divider(height: 2, thickness: 2),
                            ],
                          ),
                          SizedBox(height: 4),
                        ],
                      )),
                ),
                ToolBar(
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 15),
                          Text("Y3peHHHHNN A3Cap H1",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14))),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
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
    );
  }
}
