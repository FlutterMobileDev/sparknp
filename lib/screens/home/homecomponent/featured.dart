import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/screens/home/homecomponent/cardview.dart';

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
            press: () {
              Navigator.pushNamed(context, details);
            },
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
