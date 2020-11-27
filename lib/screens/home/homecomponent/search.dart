import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/home/homecomponent/searchitems.dart';

class Search extends StatefulWidget {
  final String search;
  const Search({Key key, this.search}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.mainColor,
        title: Text(widget.search),
      ),
      body: SearchItems(search: widget.search),
    );
  }
}
