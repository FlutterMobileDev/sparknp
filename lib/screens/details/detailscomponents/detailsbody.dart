import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/services/frontservice.dart';
import 'package:sparknp/services/productservice.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';

class DetailsBody extends StatefulWidget {
  final int productId;
  const DetailsBody(this.productId);
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  final SecureStorage secureStorage = SecureStorage();
  var _product;
  String _token;
  bool _loading;
  double rating = 3.5;
  double currency;
  f1() {
    try {
      FrontService.converter().then((value) {
        if (value != null) {
          setState(() {
            currency = value;
          });
        }
      });
    } catch (e) {
      throw Exception('loading');
    }
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
        f1();
      });
      ProductService.fetch(widget.productId).then((value) {
        _product = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String imgpath = "https://sparknp.com/assets/images/thumbnails/";
    return _loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          imgpath + _product["product"]["thumbnail"]),
                    ),
                  ),
                ),
                // ImageSlideScreen(widget.product.thumbnail),
                SizedBox(
                  height: 0.1,
                ),
                Container(
                    child: ListTile(
                  title: ListTile(
                    title: Text(
                      "Rs. ${(_product["product"]["price"] * currency).toStringAsFixed(0)}",
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Rs. ${(_product["product"]["previous_price"] * currency).toStringAsFixed(0)}",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(CupertinoIcons.heart),
                        color: LightColor.orange,
                        onPressed: () {
                          if (_token != null) {
                            WishlistService.add(
                                    _token, _product["product"]["id"])
                                .then((added) {
                              _showDialog(context, true);
                            });
                          } else {
                            _showDialog(context, false);
                          }
                        }),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_product["product"]["name"]),
                      StarRating(
                        rating: rating,
                        onRatingChanged: (rating) => this.rating = rating,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          );
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
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}

Future<void> _showDialog(context, removed) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return removed
          ? AlertDialog(title: Text('Added to wishlist'))
          : AlertDialog(title: Text('Please Log In'));
    },
  );
}
