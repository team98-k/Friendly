import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateMessage extends StatefulWidget {
  const CreateMessage({Key? key}) : super(key: key);

  _CreateMessageState createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';
  void _sendMessage(){
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),
      'userID' : user!.uid,
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
