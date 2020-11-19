import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/home/homecomponent/banners_ecommerce.dart';
import 'package:sparknp/screens/home/homecomponent/featuredcard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
import 'package:sparknp/screens/home/homecomponent/grid_view.dart';
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
              ImageCard(name: "featureProduct"),
              BannerScreen(),
              TitleWithMoreBtn(
                title: "Trending Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(name: "trendingProducts"),
              SizedBox(height: 4,),

              BannerScreen(),
              TitleWithMoreBtn(
                title: "Top Sale",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "saleProduct"),
              TitleWithMoreBtn(
                title: "Best Product",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(name: "best_products"),
              TitleWithMoreBtn(
                title: "Big Product",
                press: () {
                  print("pressed");
                },
              ),
              GridProduct(name: "big_products",),
            ],
          ),
        ),
      ]),
    ));
  }
}
