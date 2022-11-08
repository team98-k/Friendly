import 'package:flutter/material.dart';

import '../screen/create_post_screen.dart';

class PlusButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return CreatePostScreen();
            }));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Colors.blue,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}