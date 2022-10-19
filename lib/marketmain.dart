import 'package:flutter/material.dart';


void main(){
  runApp(const Market());
}

class Market extends StatelessWidget{
  const Market({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'MaterialApp',
      theme: ThemeData(
        brightness:Brightness.light,
        primaryColor: Colors.black,
      ),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('중고마켓'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            children: <Widget> [
              TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "아이디"
                ),
              ),

              TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "비밀번호"
                ),
              ),
              Row(
                children:<Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('로그인'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('회원가입'),
                  ),
                ],
              ),
            ],
          ),

        ),

      ),

    );
  }
}