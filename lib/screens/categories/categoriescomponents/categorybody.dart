import 'package:flutter/material.dart';

import 'package:sparknp/screens/categories/categoriescomponents/subcatcard.dart';

import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';
import 'package:sparknp/widgets/appbar.dart';

class CategoryBody extends StatelessWidget {
  final category;
  final bool isMulti;

  const CategoryBody({Key key, this.category, this.isMulti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (isMulti != null)
        ? Container(
            height: size.height,
            child: ListView.builder(
              itemCount: category["subs"].length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    TitleWithMoreBtn(
                      name: category["subs"][index]["name"],
                      subId: category["subs"][index]["id"],
                    ),
                    SubCatCard(subId: category["subs"][index]["id"]),
                  ],
                );
              },
            ),
          )
        : Scaffold(
            appBar: buildAppBar(context),
            body: Container(
              height: size.height,
              child: ListView.builder(
                itemCount: category["subs"].length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      TitleWithMoreBtn(
                        name: category["subs"][index]["name"],
                        subId: category["subs"][index]["id"],
                      ),
                      SubCatCard(subId: category["subs"][index]["id"]),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
