import 'package:flutter/material.dart';
import 'package:task/posts/models/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  PostDetailPage({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(post.photoUrl),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Positioned(
                      bottom: 8.0,
                      left: 5.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              post.title,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8.0,
                      top: 35.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 30),
            Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        post.body,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 40),
                      Container(
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("COMMENTS",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 26.0),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: post.comments.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                      title: Text(post.comments[index].email),
                      subtitle: Text(post.comments[index].body),
                    ),
                    SizedBox(height: 15),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
