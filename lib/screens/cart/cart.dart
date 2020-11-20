import 'package:flutter/material.dart';

import 'package:sparknp/widgets/drawer/drawer.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/cart/cartcomponents/cartbody.dart';

// TODO: Cartpage
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      // body: CartBody(),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
      backgroundColor: LightColor.mainColor,
      elevation: 0,
      iconTheme: IconThemeData(color: LightColor.textLightColor),
      centerTitle: true,
      title: Text("CART"));
}
