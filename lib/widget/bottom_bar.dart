import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(height: 50,
        child: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(icon: Icon(
              Icons.home,
              size: 18,
            ),
              child: Text("home", style: TextStyle(fontSize: 9)),
            ),
            Tab(icon: Icon(
              Icons.search,
              size: 18,
            ),
              child: Text("list", style: TextStyle(fontSize: 9)),
            ),
            Tab(icon: Icon(
              Icons.check,
              size: 18,
            ),
              child: Text("like", style: TextStyle(fontSize: 9)),
            ),
            Tab(icon: Icon(
              Icons.pets_rounded,
              size: 18,
            ),
              child: Text("profile", style: TextStyle(fontSize: 9)),
            )
          ],
        ),
      ),
    );
  }
}