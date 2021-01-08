import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:share/share.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/details/detailscomponents/comments.dart';
import 'package:sparknp/screens/details/detailscomponents/imageslider.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';

import 'package:sparknp/services/frontservice.dart';
import 'package:sparknp/services/productservice.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/cartservice.dart';

import 'package:sparknp/services/storage.dart';

class DetailsBody extends StatefulWidget {
  final int productId;
  const DetailsBody(this.productId);
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final SecureStorage secureStorage = SecureStorage();

  String _token;
  String data;
  bool _loading;

  double rating;

  var currency;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });

    FrontService.converter().then((value) {
      setState(() {
        currency = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : FutureBuilder(
            future: ProductService.fetch(widget.productId),
            // ignore: missing_return
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case ConnectionState.done:
                  if (!snapshot.hasError) {
                    List ratingList = [];
                    if (snapshot.data["ratings"].length != 0)
                      for (int i = 0;
                          i < snapshot.data["ratings"].length;
                          i++) {
                        ratingList.add(snapshot.data["ratings"][i]["rating"]);
                        rating = ratingList.fold(0, (p, c) => p + c);
                      }
                    else
                      rating = 0.0;

                    RegExp exp = RegExp(r"<[^>]*>",
                        multiLine: true, caseSensitive: true);

                    data = snapshot.data["details"].replaceAll(exp, '');
                  }
                  return (snapshot.hasError)
                      ? Center(
                          child: Text(
                            "Connect to the Internet",
                            style: AppTheme.h1Style,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              ImageSlideScreen(snapshot.data),
                              SizedBox(
                                height: 0.1,
                              ),
                              Container(
                                  child: ListTile(
                                title: ListTile(
                                  title: Text(
                                    "Rs. ${(snapshot.data["price"] * currency).toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        "Rs. ${(snapshot.data["previous_price"] * currency).toStringAsFixed(0)}",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                              Icons.add_shopping_cart_outlined),
                                          onPressed: () {
                                            (_token != null)
                                                ? CartService.add(_token,
                                                        snapshot.data["id"])
                                                    .then(
                                                    (added) {
                                                      _showDialog(context,
                                                          "Added to Cart");
                                                    },
                                                  )
                                                : _showDialog(
                                                    context, "Please Log In");
                                          }),
                                      IconButton(
                                          icon: Icon(CupertinoIcons.heart),
                                          color: LightColor.primaryColor,
                                          onPressed: () {
                                            (_token != null)
                                                ? WishlistService.add(_token,
                                                        snapshot.data["id"])
                                                    .then((added) {
                                                    _showDialog(context,
                                                        "Added to Wishlist");
                                                  })
                                                : _showDialog(
                                                    context, "Please Sign In");
                                          }),
                                    ],
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        StarRating(
                                            rating: rating,
                                            onRatingChanged: (rating) {
                                              (rating != null)
                                                  ? this.rating = rating
                                                  : this.rating = 0;
                                            }),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              Share.share(
                                                  "https://www.sparknp.com/item/${snapshot.data["slug"]}");
                                            },
                                            icon: Icon(
                                              Icons.share,
                                              color: LightColor.iconColor,
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      snapshot.data["name"],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Product SKU: ${snapshot.data["sku"]}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              new Container(
                                decoration: new BoxDecoration(
                                    color: LightColor.primaryColor),
                                child: new TabBar(
                                  indicatorWeight: 4,
                                  indicatorColor: Colors.orange[600],
                                  controller: _tabController,
                                  tabs: [
                                    new Tab(
                                      child: Text(
                                        'Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    new Tab(
                                      child: Text(
                                        'Comments',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange[600], width: 3)),
                                height: AppTheme.fullHeight(context) * 0.5,
                                child: new TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    ListView(children: [
                                      ListTile(
                                        title: Text(data),
                                      ),
                                      ListView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: (snapshot
                                                    .data["product_attributes"]
                                                    .length ==
                                                null)
                                            ? 0
                                            : snapshot
                                                .data["product_attributes"]
                                                .length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Container(
                                            child: ListTile(
                                              isThreeLine: true,
                                              title: Text(
                                                snapshot.data[
                                                        "product_attributes"]
                                                    [index]["name"],
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle: Text(
                                                snapshot.data[
                                                        "product_attributes"]
                                                    [index]["detail"],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ]),
                                    Comments(product: snapshot.data)
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Related Products",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              DetailImageCard(
                                name: "relatedProducts",
                                front: snapshot.data["category"],
                                currency: currency,
                              )
                            ],
                          ),
                        );
                default:
              }
            });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}

Future<void> _showDialog(context, txt) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(title: Text(txt));
    },
  );
}
