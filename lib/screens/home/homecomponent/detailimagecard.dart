import 'package:flutter/material.dart';

import 'package:sparknp/APIservices.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';

class DetailImageCard extends StatefulWidget {
  @override
  _DetailImageCardState createState() => _DetailImageCardState();
}

class _DetailImageCardState extends State<DetailImageCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List _productList;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.fetch().then((front) {
      setState(() {
        _productList = front.trendingProducts;
        _loading = false;
      });
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
          )
        : Container(
            width: size.width,
            height: 350,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.separated(
              itemCount: _productList.length >= 5 ? 5 : _productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                dynamic product = _productList[index];
                return GestureDetector(
                  onTap: () {
                    print("product");
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.9,
                        height: 225,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imgpath + product.thumbnail),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: size.width * 0.9,
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
