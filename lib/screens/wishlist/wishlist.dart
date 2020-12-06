import 'package:flutter/material.dart';

import 'package:sparknp/model/wishlistmodel.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';
import 'package:sparknp/screens/wishlist/wishlistcomponents/wishlistbody.dart';
import 'package:sparknp/widgets/appbar.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Wishlist wishlist;
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      _token = value;
      WishlistService.list(_token).then((data) {
        setState(() {
          wishlist = data;
          _loading = false;
        });
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
