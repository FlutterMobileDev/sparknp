import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/model/category.dart';
import 'package:sparknp/screens/categories/components/categorybody.dart';

class Categories extends StatelessWidget {
  final Category category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CategoryBody(category: category),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: LightColor.textColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: LightColor.textColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: defaultPadding / 2)
      ],
    );
  }
}
