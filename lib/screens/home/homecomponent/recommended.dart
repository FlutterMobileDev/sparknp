import 'package:flutter/material.dart';

import 'package:sparknp/screens/home/homecomponent/cardview.dart';

class Recomends extends StatelessWidget {
  const Recomends({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendCard(
            image: "assets/imagetest.jpg",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              print("pressed");
            },
          ),
          RecomendCard(
            image: "assets/1568889151top2.jpg",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendCard(
            image: "assets/imagetest.jpg",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}
