import 'package:flutter/material.dart';
import 'package:task/posts/posts.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(post.photoUrl),
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.4),
                            Colors.black,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                ),
                Positioned(
                    bottom: 30,
                    left: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        child: Text('${post.title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18)),
                      ),
                    )),
                Positioned(
                    bottom: 10,
                    left: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        child: Text('${post.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 13)),
                      ),
                    )),
              ],
            ),
          ),
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailPage(post: post),
            ),
          );
        });
  }
}
