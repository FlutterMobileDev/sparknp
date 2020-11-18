import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/home/homecomponent/banners_ecommerce.dart';
import 'package:sparknp/screens/home/homecomponent/featuredcard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
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
              Container(
                margin: EdgeInsets.all(14),
                padding: EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 75,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/1568889151top2.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              TitleWithMoreBtn(
                title: "Featured",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "featureProduct"),
              BannerScreen(),
              TitleWithMoreBtn(
                title: "Recommended",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(),
              TitleWithMoreBtn(
                title: "Top Sale",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(name: "saleProduct"),
            ],
          ),
        ),
      ]),
    ));
  }
}
