import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';

class DetailsBody extends StatefulWidget {
  final dynamic product;
  const DetailsBody(this.product);
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  final SecureStorage secureStorage = SecureStorage();
  String _token;
  double rating = 3.5;

  @override
  void initState() {
    super.initState();
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String imgpath = "https://sparknp.com/assets/images/thumbnails/";
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgpath + widget.product.thumbnail),
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
                "Rs. ${widget.product.price}",
              ),
              subtitle: Row(
                children: [
                  Text(
                    "Rs. ${widget.product.previousPrice}",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              trailing: IconButton(
                  icon: Icon(CupertinoIcons.heart),
                  color: LightColor.orange,
                  onPressed: () {
                    if (_token != null) {
                      WishlistService.add(_token, widget.product.id)
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
                Text(widget.product.name),
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
