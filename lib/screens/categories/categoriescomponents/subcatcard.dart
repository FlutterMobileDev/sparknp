import 'package:flutter/material.dart';
import 'package:sparknp/model/subcategorymodel.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/services/frontservice.dart';

class SubCatCard extends StatefulWidget {
  final int subId;

  const SubCatCard({Key key, this.subId}) : super(key: key);

  @override
  _SubCatCardState createState() => _SubCatCardState();
}

class _SubCatCardState extends State<SubCatCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;

  bool _loading;
  SubCat _subCatList;

  @override
  void initState() {
    super.initState();
    _loading = true;
    // TODO: Use widget.subId here instead of 20 when there is data
    FrontService.subcat(widget.subId).then((data) {
      setState(() {
        _subCatList = data;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (_loading)
        ? Container(
            height: 150,
            child: Center(child: CircularProgressIndicator()),
          )
        : Container(
            width: size.width,
            height: size.height * 0.7,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: GridView.builder(
              physics: ScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: _subCatList.products.length,
              itemBuilder: (context, index) {
                dynamic product = _subCatList.products[index];
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
                                  product.name.toUpperCase(),
                                  style: TextStyle(
                                      color: LightColor.textLightColor),
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

  @override
  void dispose() {
    Navigator.pop(context);
    print("pop");
    super.dispose();
  }
}
