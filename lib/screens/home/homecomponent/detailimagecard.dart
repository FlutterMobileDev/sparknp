import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';

class DetailImageCard extends StatefulWidget {
  final String name;
  final front;
  final double currency;

  const DetailImageCard({Key key, this.name, this.front, this.currency})
      : super(key: key);

  @override
  _DetailImageCardState createState() => _DetailImageCardState();
}

class _DetailImageCardState extends State<DetailImageCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;

  @override
  void initState() {
    super.initState();
    switch (widget.name) {
      case "trendingProducts":
        return setState(() {
          _productList = widget.front["trending_products"];
        });
      case "bestProducts":
        return setState(() {
          _productList = widget.front["best_products"];
        });
      case "hotProducts":
        return setState(() {
          _productList = widget.front["hot_products"];
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _productList.length >= 10 ? 10 : _productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          dynamic product = _productList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(3, 0, 3, 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, details, arguments: product);
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 130,
                        width: 96,
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
                      height: size.height * 0.06,
                      width: 96,
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
                              product["name"].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "\Rs ${(product["price"] * widget.currency).toStringAsFixed(0)}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: LightColor.textLightColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 0,
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
