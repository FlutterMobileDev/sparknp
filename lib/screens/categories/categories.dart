import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';

class Categories extends StatefulWidget {
  final List<Category> category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String imgpath = "https://sparknp.com/assets/images/categories/";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.primaryColor,
        centerTitle: true,
        title: Text("Categories"),
      ),
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
                      image:
                          NetworkImage(imgpath + widget.category[index].photo),
                    ),
                  ),
                ),
                title: TitleText(
                  text: widget.category[index].name,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              );
            }),
      ),
    );
  }
}
