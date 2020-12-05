import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/wishlistmodel.dart';
import 'package:sparknp/model/productmodel.dart';

import 'package:sparknp/services/productservice.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';

class WishlistBody extends StatefulWidget {
  final Wishlist wishlist;
  const WishlistBody({Key key, this.wishlist}) : super(key: key);

  @override
  _WishlistBodyState createState() => _WishlistBodyState();
}

class _WishlistBodyState extends State<WishlistBody> {
  List _wishlistList;
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  String _token;
  List<String> _productName = [];

  ProductDetails _product;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) async {
      int n = widget.wishlist.wishlists.length;
      for (int i = 1; i <= n; i++) {
        await ProductService.fetch(widget.wishlist.wishlists[i - 1].productId)
            .then((value) {
          _product = value;
          print(_product.product.name);
          _productName.add(_product.product.name);
        });
      }
      setState(() {
        _token = value;
        _wishlistList = widget.wishlist.wishlists;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            padding: AppTheme.padding,
            child: SingleChildScrollView(
              child: (widget.wishlist.wishlists.length == 0)
                  ? Container(
                      height: 400,
                      child: Center(
                        child: Text("No Items in Wishlist"),
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        _item(widget.wishlist),
                      ],
                    ),
            ),
          );
  }

  Widget _item(Wishlist model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 450,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _wishlistList.length,
        itemBuilder: (context, index) {
          dynamic product = _wishlistList[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, details,
                    arguments: _product.product);
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.175,
                child: Column(children: [
                  ListTile(
                    title: Text(
                      "${_wishlistList[index].product.name}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.clip,
                    ),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: LightColor.orange,
                      onPressed: () {
                        WishlistService.remove(_token, product.id)
                            .then((value) {
                          _showDialog(context).whenComplete(() {
                            Navigator.popAndPushNamed(context, wishlist);
                          });
                        });
                      },
                      child: Text(
                        "Remove",
                        style: TextStyle(color: LightColor.background),
                      ),
                    ),
                  ),
                ]),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            height: 70,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Removed from Wishlist'),
      );
    },
  );
}
