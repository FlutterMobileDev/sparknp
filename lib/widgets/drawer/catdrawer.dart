import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/model/frontjson.dart';

class MyExploreAll extends StatefulWidget {
  final VoidCallback goBack;
  final ApiFront front;

  const MyExploreAll({this.goBack, this.front});

  @override
  _MyExploreAllState createState() => _MyExploreAllState();
}

class _MyExploreAllState extends State<MyExploreAll> {
  @override
  Widget build(BuildContext context) {
    List<Category> _catList = widget.front.categories;
    return ListView.builder(
      itemCount: _catList.length,
      itemBuilder: (context, index) {
        Category category = _catList[index];
        return ListTile(
          title: Text(category.name),
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              categories,
              arguments: category,
            );
          },
        );
      },
    );
  }
}
