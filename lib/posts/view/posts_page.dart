import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/posts/posts.dart';
import 'package:http/http.dart' as http;
import 'package:task/posts/widgets/toolbar.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 50), child: PostsList()),
            ToolBar(),
          ],
        ),
      ),
    );
  }
}
