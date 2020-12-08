import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/services/frontservice.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final front;
  final int subId;
  const ItemCard({
    Key key,
    this.name,
    this.front,
    this.subId,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    switch (widget.name) {
      case "Featured Products":
        return setState(() {
          _productList = widget.front["feature_products"];
          _loading = false;
        });

      case "Trending Products":
        return setState(() {
          _productList = widget.front["trending_products"];
          _loading = false;
        });
      case "Sale Products":
        return setState(() {
          _productList = widget.front["sale_products"];
          _loading = false;
        });
      case "Best Products":
        return setState(() {
          _productList = widget.front["best_products"];
          _loading = false;
        });
      case "Big Products":
        return setState(() {
          _productList = widget.front["big_products"];
          _loading = false;
        });
      case "Latest Products":
        return setState(() {
          _productList = widget.front["latest_products"];
          _loading = false;
        });
      case "Top Products":
        return setState(() {
          _productList = widget.front["top_products"];
          _loading = false;
        });
      case "Hot Products":
        return setState(() {
          _productList = widget.front["hot_products"];
          _loading = false;
        });
      case "Discount Product":
        return setState(() {
          _productList = widget.front["discount_products"];
          _loading = false;
        });
      default:
        FrontService.subcat(widget.subId).then((data) {
          setState(() {
            _productList = data["products"];
            _loading = false;
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
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
                            height: 280,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              imgpath + product["thumbnail"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
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
                                  color:
                                      LightColor.primaryColor.withOpacity(0.23),
                                ),
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding / 4,
                                    horizontal: defaultPadding / 4),
                                child: Text(
                                  product["name"].toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "\Rs ${product["price"]}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: LightColor.textLightColor,
                                    fontWeight: FontWeight.normal),
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
