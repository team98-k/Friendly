import 'package:flutter/material.dart';
import 'package:testapp/screen/more_screen.dart';
import 'screen/home_screen.dart';
import 'widget/bottom_bar.dart';

void main() => runApp(MyApp());

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
              Container(
                child: Center(
                  child: Text("list"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("shop"),
                ),
              ),
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
