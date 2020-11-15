import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String arg;
  Categories(this.arg);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arg),
      ),
    );
  }
}
