import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: LightColor.primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(color: LightColor.textLightColor),
    centerTitle: true,
    title: Container(
      width: AppTheme.fullWidth(context) * 0.8,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: FlatButton(
        textColor: LightColor.iconColor,
        child: Padding(
          padding:
              EdgeInsets.only(right: ((AppTheme.fullWidth(context) * 0.4))),
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 10),
              Text("Search"),
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            search,
          );
        },
      ),
    ),
  );
}
