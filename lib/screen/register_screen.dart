import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  bool view = true;
  String userEmail = "";
  String userPassword = "";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',
      theme: ThemeData(
        brightness: Brightness.light,
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
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                key: ValueKey(1),
                onChanged: (value) {
                  userEmail = value;
                },
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty || value.contains('@')) {
                    return '이메일 주소를 확인해 주세요.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), hintText: "이메일"),
              ),
              TextFormField(
                key: ValueKey(2),
                onChanged: (value) {
                  userPassword = value;
                },
                obscureText: view,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return '7글자 이상의 비밀번호를 입력해 주세요.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), hintText: "비밀번호"),
              ),
              TextFormField(
                key: ValueKey(3),
                obscureText: view,
                controller: _passwordController2,
                validator: (value) {
                  if (value != _passwordController) {
                    return '비밀번호를 확인하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "비밀번호를 한번 더 입력하세요"),
              ),
              ElevatedButton(
                child: Text('회원가입'),
                onPressed: () async {
                  try {
                    final newUser =
                        await firebaseAuth.createUserWithEmailAndPassword(
                      email: userEmail,
                      password: userPassword,
                    );
                    if (newUser.user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("이메일 또는 비밀번호를 확인하세요"),
                      backgroundColor: Colors.blue,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
