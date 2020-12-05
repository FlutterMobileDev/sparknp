import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/screens/categories/categoriescomponents/subcatcard.dart';

import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';

class CategoryBody extends StatelessWidget {
  final Category category;

  const CategoryBody({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: category.subs.length,
      itemBuilder: (BuildContext context, index) {
        return Column(
          children: [
            TitleWithMoreBtn(
              name: category.subs[index].name,
              subId: category.subs[index].id,
            ),
            SubCatCard(subId: category.subs[index].id),
          ],
        );
      },
    );
  }
}
