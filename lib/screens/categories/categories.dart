import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

class Categories extends StatelessWidget {
  final Category category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CategoryBody(category: category),
    );
  }
}
