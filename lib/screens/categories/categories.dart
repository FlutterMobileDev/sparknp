import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/model/screenarguments.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';
import 'package:sparknp/widgets/appbar.dart';

class Categories extends StatefulWidget {
  final List category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin<Categories> {
  @override
  bool get wantKeepAlive => true;
  String imgpath = "https://sparknp.com/assets/images/categories/";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        height: size.height,
        child: ListView.builder(
            itemCount: widget.category.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                leading: Container(
                  width: size.width * 0.125,
                  height: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          imgpath + widget.category[index]["photo"]),
                    ),
                  ),
                ),
                title: TitleText(
                  text: widget.category[index]["name"],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                onTap: () {
                  Navigator.pushNamed(context, categories,
                      arguments:
                          ScreenArguments(category: widget.category[index]));
                  CategoryBody(
                    category: widget.category[index],
                  );
                },
              );
            }),
      ),
    );
  }
}
