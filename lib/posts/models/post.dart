import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  const Post({
    @required this.id,
    @required this.title,
    @required this.body,
    this.photoUrl,
    this.comments,
  });

  final int id;
  final String title;
  final String body;
  final String photoUrl;
  final List<PostComments> comments;

  @override
  List<Object> get props => [id, title, body, photoUrl, comments];
}

class PostComments extends Equatable {
  const PostComments({
    @required this.id,
    @required this.email,
    @required this.body,
  });

  final int id;
  final String email;
  final String body;

  @override
  List<Object> get props => [id, email, body];
}
