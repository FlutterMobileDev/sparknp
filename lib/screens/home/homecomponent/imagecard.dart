import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/services/frontservice.dart';

class ImageCard extends StatefulWidget {
  final String name;
  @override
  _ImageCardState createState() => _ImageCardState();
  const ImageCard({Key key, this.name}) : super(key: key);
}

class _ImageCardState extends State<ImageCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;
  bool _loading;

  @override
  void initState() {
    super.initState();

    _loading = true;
    Services.fetch().then(
      (front) {
        if (widget.name == "featureProducts") {
          setState(() {
            _productList = front.featureProducts;
          });
        } else if (widget.name == "saleProducts") {
          setState(() {
            _productList = front.saleProducts;
          });
        } else if (widget.name == "latestProducts") {
          setState(() {
            _productList = front.latestProducts;
          });
        } else if (widget.name == "hotProducts") {
          setState(() {
            _productList = front.hotProducts;
          });
        }
        _loading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (_loading)
        ? Container(
            margin: EdgeInsets.only(
              left: defaultPadding,
              top: defaultPadding / 2,
              bottom: defaultPadding / 2,
            ),
            width: size.width * 0.8,
            height: 185,
            child: Center(child: CircularProgressIndicator()),
          )
        : Container(
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
