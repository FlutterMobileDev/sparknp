import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/model/wishlistmodel.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/screens/wishlist/wishlistcomponents/wishlistbody.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Wishlist wishlist;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    WishlistService.list().then((data) {
      setState(() {
        wishlist = data;
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
          : WishlistBody(wishlist: wishlist),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
      backgroundColor: LightColor.mainColor,
      elevation: 0,
      iconTheme: IconThemeData(color: LightColor.textLightColor),
      centerTitle: true,
      title: Text("wishlist"));
}
