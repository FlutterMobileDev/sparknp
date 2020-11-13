import 'package:flutter/material.dart';


import 'constraints.dart';


class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeatureCard(
            image: "assets/1568889151top2.jpg",
            press: () {},
          ),

          FeatureCard(
            image: "assets/imagetest.jpg",
            press: () {},
          ),
          FeatureCard(
            image: "assets/1568889151top2.jpg",
            press: () {},
          ),
          FeatureCard(
            image: "assets/1568889151top2.jpg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image.toString()),
          ),
        ),
      ),
    );
  }
}