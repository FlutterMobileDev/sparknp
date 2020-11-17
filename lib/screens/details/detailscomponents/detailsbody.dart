import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparknp/screens/details/detailscomponents/imageslider.dart';

class DetailsBody extends StatelessWidget {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageSlideScreen(),
          SizedBox(
            height: 0.1,
          ),
          Container(
              child: ListTile(
            title: ListTile(
              title: Text(
                "RS 1600",
              ),
              subtitle: Row(
                children: [
                  Text(
                    "RS 1700",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  Text(" -34%")
                ],
              ),
              trailing: IconButton(
                  icon: Icon(CupertinoIcons.heart),
                  onPressed: () {
                    print("wishlist");
                  }),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("White Peak Trekking Jacket"),
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
