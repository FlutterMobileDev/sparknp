import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/screens/categories/categoriescomponents/swipebar.dart';

class CategoryBody extends StatelessWidget {
  final Category category;

  const CategoryBody({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SwipeBar(category: category),
      ],
    );
  }
}
