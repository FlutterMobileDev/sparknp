import 'package:flutter/material.dart';

import 'package:sparknp/APIservices.dart';
import 'package:sparknp/constants.dart';

class GridProduct extends StatefulWidget{
  final String name;
  final String scale;

  const GridProduct({Key key, this.name, this.scale}) : super(key: key);
  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.fetch().then((front) {
      if(widget.name == "big_products") {
        setState(() {
          _productList = front.bigProducts;
          _loading = false;
        });
      }
      if(widget.name == "best_products") {
        setState(() {
          _productList = front.bestProducts;
          _loading = false;
        });
      }
    });
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
      height: 300,
      child: Center(child: CircularProgressIndicator()),
    ):Container(
      width: size.width,
      height: 500,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: (widget.scale == "large")?_productList.length:4,
            itemBuilder: (context, index){
              dynamic product = _productList[index];
              return GestureDetector(
                onTap: () {
                  print("product");
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imgpath + product.thumbnail),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 180,
                            height: 120,
                            padding: EdgeInsets.all(defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                              ],
                            ),
                            child: Row(children: <Widget>[
                              Expanded(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: product.name.toUpperCase(),
                                        style:
                                        Theme.of(context).textTheme.button),
                                  ]),
                                ),
                              ),
                              Spacer(),
                              Text(
                                product.price,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: LightColor.primaryColor),
                              )
                            ]),
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
