import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post extends Equatable {
  const Post({
    @required this.id,
    @required this.title,
    @required this.body,
    this.photoUrl,
    this.comments,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final String photoUrl;

  @HiveField(4)
  final List<PostComments> comments;

  @override
  List<Object> get props => [id, title, body, photoUrl, comments];
}

@HiveType(typeId: 2)
class PostComments extends Equatable {
  const PostComments({
    @required this.id,
    @required this.email,
    @required this.body,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String body;

  @override
  List<Object> get props => [id, email, body];
}
