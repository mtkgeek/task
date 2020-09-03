import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/posts/posts.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  // final _scrollController = ScrollController();
  PostBloc _postBloc;
  var box = Hive.box('myBox');
  List storedPosts;

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
    _postBloc = context.bloc<PostBloc>();
    storedPosts = box.get('storedPost');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        if (!state.hasReachedMax && _isBottom) {
          _postBloc.add(PostFetched());
        }
      },
      builder: (context, state) {
        print('hereeeeee');
        print(storedPosts);
        switch (state.status) {
          case PostStatus.failure:
            return storedPosts != null && storedPosts.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return PostListItem(post: storedPosts[index]);
                    },
                    itemCount: storedPosts.length,
                    // controller: _scrollController,
                  )
                : const Center(child: Text('failed to fetch posts'));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return storedPosts != null && storedPosts.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return PostListItem(post: storedPosts[index]);
                      },
                      itemCount: storedPosts.length,
                      // controller: _scrollController,
                    )
                  : const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? BottomLoader()
                    : PostListItem(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              // controller: _scrollController,
            );
          default:
            return Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 48.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 48.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 200,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 48.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
        }
      },
    );
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _postBloc.add(PostFetched());
  }

  bool get _isBottom {
    // final maxScroll = _scrollController.position.maxScrollExtent;
    // final currentScroll = _scrollController.offset;
    // return currentScroll >= (maxScroll * 0.9);
    return false;
  }
}
