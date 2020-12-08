import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

class ImageCard extends StatefulWidget {
  final String name;
  final front;

  @override
  _ImageCardState createState() => _ImageCardState();
  const ImageCard({Key key, this.name, this.front}) : super(key: key);
}

class _ImageCardState extends State<ImageCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;

  @override
  void initState() {
    super.initState();
    switch (widget.name) {
      case "featureProducts":
        return setState(() {
          _productList = widget.front["feature_products"];
        });
      case "trendingProducts":
        return setState(() {
          _productList = widget.front["trending_products"];
        });
      case "saleProducts":
        return setState(() {
          _productList = widget.front["sale_products"];
        });
      case "bestProducts":
        return setState(() {
          _productList = widget.front["best_products"];
        });
      case "bigProducts":
        return setState(() {
          _productList = widget.front["big_products"];
        });
      case "latestProducts":
        return setState(() {
          _productList = widget.front["latest_products"];
        });
      case "topProducts":
        return setState(() {
          _productList = widget.front["top_products"];
        });
      case "hot_products":
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
      height: 95,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _productList.length >= 10 ? 10 : _productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          dynamic product = _productList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(2, 0, 2, 4),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, details, arguments: product);
              },
              child: Container(
                height: 90,
                width: 98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgpath + product["thumbnail"]),
                  ),
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
