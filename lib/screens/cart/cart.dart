import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/model/cartmodel.dart';
import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/screens/cart/cartcomponents/cartbody.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart cart;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    CartService.list().then((data) {
      setState(() {
        cart = data;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: (_loading)
          ? Center(child: CircularProgressIndicator())
          : CartBody(cart: cart),
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
