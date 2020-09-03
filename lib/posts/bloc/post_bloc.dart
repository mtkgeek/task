import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/posts/posts.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.httpClient}) : super(const PostState());

  final http.Client httpClient;

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield await _mapPostFetchedToState(state);
    }
  }

  Future<PostState> _mapPostFetchedToState(PostState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts(0, 20);

        return state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        );
      }
      final posts = await _fetchPosts(state.posts.length, 20);

      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: PostStatus.failure);
    }
  }

  Future<Post> _transformPosts(Post post) async {
    List<PostComments> comments;
    String url;

    final getPostPhotosResponse = await httpClient.get(
      'https://jsonplaceholder.typicode.com/albums/${post.id}/photos',
    );

    final getPostCommentsResponse = await httpClient.get(
      'https://jsonplaceholder.typicode.com/posts/${post.id}/comments',
    );

    if (getPostPhotosResponse.statusCode == 200) {
      final dataTwo = json.decode(getPostPhotosResponse.body) as List;

      url = dataTwo[0]['url'];
    }

    if (getPostCommentsResponse.statusCode == 200) {
      final decodedResponse = json.decode(getPostCommentsResponse.body) as List;
      comments = decodedResponse.map((dynamic rawResponse) {
        return PostComments(
          id: rawResponse['id'] as int,
          email: rawResponse['email'] as String,
          body: rawResponse['body'] as String,
        );
      }).toList();
      return Post(
        id: post.id,
        title: post.title,
        body: post.body,
        photoUrl: url,
        comments: comments,
      );
    }
    throw Exception('error fetching posts');
  }

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
      'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit',
    );

    List<Post> tempPosts;
    // List<Post> finalPosts;

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      tempPosts = data.map((dynamic rawPost) {
        return Post(
          id: rawPost['id'] as int,
          title: rawPost['title'] as String,
          body: rawPost['body'] as String,
        );
      }).toList();

      for (int i = 0; i < tempPosts.length; i++) {
        Post post = tempPosts[i];
        tempPosts[i] = await _transformPosts(post);
      }
      return tempPosts;
    }

    throw Exception('error fetching posts');
  }
}
