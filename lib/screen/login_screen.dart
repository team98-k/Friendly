import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget{
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
                    hintText: "비밀번호",
                    suffixIcon: IconButton(icon:Icon(Icons.visibility_off),
                    onPressed:() {},
                    ),
                ),
               textInputAction: TextInputAction.next,
               obscureText: true,
              ),
              Row(
                children:<Widget>[
                  ElevatedButton(
                    child: Text('로그인'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text('회원가입'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
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

