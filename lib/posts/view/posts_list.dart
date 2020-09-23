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

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
    _postBloc = context.bloc<PostBloc>();
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
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? BottomLoader()
                    : Column(
                        children: <Widget>[
                          PostListItem(post: state.posts[index]),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(height: 5, thickness: 5),
                          ),
                        ],
                      );
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
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
