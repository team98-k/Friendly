import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() = _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30)),
          Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: <Widget>[
                Expanded(flex: 6, child: TextField(
                  focusNode: focusNode,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  autofocus: true,
                  controller: _filter,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white60,
                      size: 20,
                    ),
                    suffixIcon: focusNode.hasFocus
                        ? IconButton(
                        icon: Icon(Icons.cancel, size: 20,),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = "";
                          });
                        })
                        : Container(),
                    hintText: '검색',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    )
                  ),
                ),
                )
              ],
            ),
          )
        ],
      )
      ,
    );
  }
}
