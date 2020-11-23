import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/widgets/appbar/barbutton.dart';

AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: LightColor.mainColor,
    elevation: 0,
    iconTheme: IconThemeData(color: LightColor.textLightColor),
    centerTitle: true,
    title: Container(
      width: 270,
      height: 40,
      decoration: BoxDecoration(
        color: LightColor.primaryColor.withOpacity(0.3),
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
      ),
    ),
    actions: <Widget>[
      Row(children: [
        SizedBox(
          width: 5,
        ),
        IconBtnWithCounter(
            svgSrc: "assets/Cart Icon.svg",
            // numOfitem: cart.carts,
            press: () {
              Navigator.pushNamed(
                context,
                cart,
              );
            }),
        IconBtnWithCounter(
            svgSrc: "assets/Heart Icon.svg",
            // numOfitem: 5,
            press: () {
              Navigator.pushNamed(
                context,
                wishlist,
              );
            }),
        SizedBox(width: defaultPadding / 2)
      ])
    ],
  );
}
