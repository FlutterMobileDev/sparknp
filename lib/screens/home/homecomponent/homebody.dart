import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/home/homecomponent/banners.dart';
import 'package:sparknp/screens/home/homecomponent/imagecard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
import 'package:sparknp/screens/home/homecomponent/gridview.dart';
import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              LightColor.background,
              LightColor.background,
              LightColor.background,
              LightColor.background,
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          )),
        ),
        Container(
          child: Column(
            children: [
              BannerScreen(),
              TitleWithMoreBtn(
                title: "Featured",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "featureProducts"),
              BannerScreen(),
              TitleWithMoreBtn(
                title: "Trending Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(name: "trendingProducts"),
              SizedBox(
                height: 4,
              ),
              BannerScreen(),
              TitleWithMoreBtn(
                title: "Top Sale",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "saleProducts"),
              TitleWithMoreBtn(
                title: "Best Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(name: "bestProducts"),
              TitleWithMoreBtn(
                title: "Big Products",
                press: () {
                  print("pressed");
                },
              ),
              GridProduct(
                name: "bigProducts",
              ),
              TitleWithMoreBtn(
                title: "Latest Products",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "latestProducts"),
              TitleWithMoreBtn(
                title: "Top Products",
                press: () {
                  print("pressed");
                },
              ),
              GridProduct(
                name: "topProducts",
              ),
              TitleWithMoreBtn(
                title: "Hot Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(name: "hotProducts"),
            ],
          ),
        ),
      ]),
    ));
  }
}
