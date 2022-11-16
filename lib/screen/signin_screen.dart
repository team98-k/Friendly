import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/main.dart';
import 'package:testapp/screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  bool view = true;
  String userEmail = "";
  String userPassword = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      key: _FormKey,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('환영합니다. 프랜들리입니다.'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            children: <Widget>[
              TextField(
                key: ValueKey(1),
                onChanged: (value) {
                  userEmail = value;
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), hintText: "이메일"),
              ),
              TextField(
                key: ValueKey(2),
                onChanged: (value) {
                  userPassword = value;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "비밀번호",
                  suffixIcon: view
                      ? IconButton(
                          onPressed: () {
                            view = !view;
                          },
                          icon: Icon(Icons.visibility_off))
                      : IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            view = !view;
                          },
                        ),
                ),
                textInputAction: TextInputAction.next,
                obscureText: view,
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    child: Text('로그인'),
                    onPressed: () async {
                      try {
                        final newUser =
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: userEmail, password: userPassword);
                        if (newUser.user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MyApp();
                              }));
                        }
                      }catch(e) {
                        print(e);
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text('회원가입'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SignupScreen();
                      }));
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
