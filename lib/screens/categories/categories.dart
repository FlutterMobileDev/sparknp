import 'package:flutter/material.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';
import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/model/category.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

//TODO: stop multiple category routing

class Categories extends StatelessWidget {
  final Category category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      body: CategoryBody(category: category),
    );
  }
}
