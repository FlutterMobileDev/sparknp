import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final ApiFront front;
  const ItemCard({
    Key key,
    this.name,
    this.front,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;

  @override
  void initState() {
    super.initState();
    if (widget.name == "Featured Products") {
      setState(() {
        _productList = widget.front.featureProducts;
      });
    }
    if (widget.name == "Trending Products") {
      setState(() {
        _productList = widget.front.trendingProducts;
      });
    }
    if (widget.name == "Sale Products") {
      setState(() {
        _productList = widget.front.saleProducts;
      });
    }
    if (widget.name == "Best Products") {
      setState(() {
        _productList = widget.front.bestProducts;
      });
    }
    if (widget.name == "Big Products") {
      setState(() {
        _productList = widget.front.bigProducts;
      });
    }
    if (widget.name == "Latest Products") {
      setState(() {
        _productList = widget.front.latestProducts;
      });
    }
    if (widget.name == "Top Products") {
      setState(() {
        _productList = widget.front.topProducts;
      });
    }
    if (widget.name == "Hot Products") {
      setState(() {
        _productList = widget.front.hotProducts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
        physics: ScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          dynamic product = _productList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, details, arguments: product);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        imgpath + product.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: LightColor.background,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: LightColor.primaryColor.withOpacity(0.23),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding / 4,
                              horizontal: defaultPadding / 4),
                          child: Text(
                            // products is out demo list
                            product.name.toUpperCase(),
                            style: TextStyle(color: LightColor.textLightColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\Rs ${product.price}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
