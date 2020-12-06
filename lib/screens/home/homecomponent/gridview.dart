import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/model/frontjson.dart';

class GridProduct extends StatefulWidget {
  final String name;
  final String scale;
  final ApiFront front;

  const GridProduct({Key key, this.name, this.scale, this.front})
      : super(key: key);
  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;

  @override
  void initState() {
    super.initState();
    if (widget.name == "bigProducts") {
      setState(() {
        _productList = widget.front.bigProducts;
      });
    }
    if (widget.name == "bestProducts") {
      setState(() {
        _productList = widget.front.bestProducts;
      });
    }
    if (widget.name == "topProducts") {
      setState(() {
        _productList = widget.front.topProducts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 4,
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
