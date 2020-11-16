import 'package:flutter/material.dart';
import 'package:sparknp/model/category.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/model/product.dart';

import 'package:sparknp/screens/categories/categoriescomponents/swipebar.dart';
import 'package:sparknp/screens/categories/categoriescomponents/item_card.dart';

class CategoryBody extends StatelessWidget {
  final Category category;

  const CategoryBody({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SwipeBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () => Navigator.pushNamed(context, details),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
