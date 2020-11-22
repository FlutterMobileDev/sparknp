import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/wishlistmodel.dart';
import 'package:sparknp/screens/wishlist/wishlistcomponents/title_text.dart';

class WishlistBody extends StatefulWidget {
  final Wishlist wishlist;
  const WishlistBody({Key key, this.wishlist}) : super(key: key);

  @override
  _WishlistBodyState createState() => _WishlistBodyState();
}

class _WishlistBodyState extends State<WishlistBody> {
  List _wishlistList;

  @override
  void initState() {
    super.initState();
    setState(() {
      _wishlistList = widget.wishlist.wishlists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: (widget.wishlist.wishlists.length == 0)
            ? Center(
                child: Text("No Items in wishlist"),
              )
            : Column(
                children: <Widget>[
                  _item(widget.wishlist),
                  Divider(
                    thickness: 1,
                    height: 70,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _item(Wishlist model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _wishlistList.length,
        itemBuilder: (context, index) {
          dynamic product = _wishlistList[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, details, arguments: product);
              },
              child: Container(
                width: size.width * 0.8,
                height: 80,
                child: Column(children: [
                  Expanded(
                    child: ListTile(
                      title: TitleText(
                        text: "Product ID : ${product.productId}",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      // subtitle: Row(children: <Widget>[
                      //   TitleText(
                      //     text: '\Rs ',
                      //     color: LightColor.red,
                      //     fontSize: 12,
                      //   ),
                      //   TitleText(
                      //     text: product.product.price.toString(),
                      //     fontSize: 14,
                      //   ),
                      // ],
                      // ),
                    ),
                  ),
                ]),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
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
