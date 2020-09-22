import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  const Post(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.photoUrl,
      @required this.name});

  final int id;

  final String title;

  final String name;

  final String body;

  final String photoUrl;

  @override
  List<Object> get props => [id, title, body, name, photoUrl];
}
