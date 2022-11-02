import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Register());
}

class Register extends StatelessWidget{
  const Register({Key? key}) : super(key: key);
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
            title: Text('환영합니다. 프랜들리입니다.'),
            centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            children: [
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
              TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "이름"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "이메일"
                ),
              ),
              ElevatedButton(
                child: Text('회원가입'),
                onPressed: () {
                  Navigator.pop(context);},
                  ),
            ],
          ),
        ),
      ),

    );
  }
}

