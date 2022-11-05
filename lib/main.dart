import 'package:flutter/material.dart';
import 'package:testapp/screen/like_screen.dart';
import 'package:testapp/screen/more_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/screen/search_screen.dart';
import 'screen/home_screen.dart';
import 'widget/bottom_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Friendly",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              SearchScreen(),
              LikeScreen(),
              Container(
                child: Center(
                  child: Text("profile"),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
