import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/widget/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String posterTitle = "";
  String content = "";

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
  Random _rand = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rand.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: '제목'),
              onChanged: (value) {
                setState(() {
                  posterTitle = value;
                });
              },
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '내용',
              ),
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  String postKey = getRandomString(16);
                  firestore.collection('posts').doc(postKey).set({
                    "key": postKey,
                    "title": posterTitle,
                    "explain": content,
                    "firstPicUrl": "",
                    "firstPicWidth": 0,
                    "firstPicHeight": 0,
                    "authorName": "huni",
                    "like": true,
                  });
                },
                child: Text("업로드"))
          ],
        ),
      ]),
    );
  }
}
