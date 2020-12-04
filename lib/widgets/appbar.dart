import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

AppBar buildAppBar(context) {
  Size size = MediaQuery.of(context).size;

  return AppBar(
    backgroundColor: LightColor.primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(color: LightColor.textLightColor),
    title: Center(
      child: Container(
        width: size.width * 0.6,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              )),
          onTap: () {
            Navigator.pushNamed(
              context,
              search,
            );
          },
        ),
      ),
    ),
  );
}
