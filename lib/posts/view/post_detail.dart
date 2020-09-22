import 'package:flutter/material.dart';
import 'package:task/posts/models/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  PostDetailPage({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A3kaPm",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 25.0,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 25.0,
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
                  margin: EdgeInsets.only(top: 100),
                  child: Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              '${post.body}\n${post.body}\n${post.body}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          SizedBox(height: 40),
                          Divider(height: 3, thickness: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Text("Y3peHHHHNN A3Cap H1",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                          Divider(height: 4, thickness: 4),
                          SizedBox(height: 4),
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Material(
                          elevation: 5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on,
                                          color: Colors.green),
                                      SizedBox(width: 3),
                                      Text(
                                        'MoocKaa',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '07:30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '12:30',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '07:30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '07:30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '07:30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(Icons.notifications, color: Colors.green),
                              ]),
                        ),
                      ),
                      Divider(height: 2, thickness: 2),
                      Material(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10),
                              child: Text("Y3peHHHHNN A3Cap H1",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 3, thickness: 3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
