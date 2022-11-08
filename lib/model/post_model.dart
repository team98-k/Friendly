import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Post {
  String key;
  String title;
  String explain;
  String firstPicUrl;
  int firstPicWidth;
  int firstPicHeight;
  String authorName;
  int like;

  Post(
      {required this.key,
      required this.title,
      required this.explain,
      required this.firstPicUrl,
      required this.firstPicWidth,
      required this.firstPicHeight,
      required this.authorName,
      required this.like});
}
