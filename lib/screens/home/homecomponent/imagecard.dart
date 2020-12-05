import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/model/frontjson.dart';

class ImageCard extends StatefulWidget {
  final String name;
  final ApiFront front;

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
          _productList = widget.front.featureProducts;
        });
      case "trendingProducts":
        return setState(() {
          _productList = widget.front.trendingProducts;
        });
      case "saleProducts":
        return setState(() {
          _productList = widget.front.saleProducts;
        });
      case "bestProducts":
        return setState(() {
          _productList = widget.front.bestProducts;
        });
      case "bigProducts":
        return setState(() {
          _productList = widget.front.bigProducts;
        });
      case "latestProducts":
        return setState(() {
          _productList = widget.front.latestProducts;
        });
      case "topProducts":
        return setState(() {
          _productList = widget.front.topProducts;
        });
      case "hotProducts":
        return setState(() {
          _productList = widget.front.hotProducts;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 185,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _productList.length >= 5 ? 5 : _productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          dynamic product = _productList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, details, arguments: product);
            },
            child: Container(
              width: size.width * 0.8,
              height: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgpath + product.thumbnail),
                ),
              ),
            ),
          );
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
