import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/posts/posts.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
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
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 25.0, // add custom icons also
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
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(margin: EdgeInsets.only(top: 50), child: PostsList()),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
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
                                Icon(Icons.location_on, color: Colors.green),
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
                              border: Border.all(width: 1, color: Colors.green),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
