import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/home/homecomponent/banners.dart';
import 'package:sparknp/screens/home/homecomponent/imagecard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
import 'package:sparknp/screens/home/homecomponent/gridview.dart';
import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';

class HomeBody extends StatefulWidget {
  final ApiFront front;
  const HomeBody({Key key, this.front}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Stack(children: [
        Container(
          height: size.height,
          width: size.width,
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
              BannerCard(front: widget.front),
              TitleWithMoreBtn(
                title: "Featured",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(
                name: "featureProducts",
                front: widget.front,
              ),
              BannerCard(front: widget.front),
              TitleWithMoreBtn(
                title: "Trending Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(
                name: "trendingProducts",
                front: widget.front,
              ),
              SizedBox(
                height: 4,
              ),
              BannerCard(front: widget.front),
              TitleWithMoreBtn(
                title: "Top Sale",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(
                name: "saleProducts",
                front: widget.front,
              ),
              TitleWithMoreBtn(
                title: "Best Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(
                name: "bestProducts",
                front: widget.front,
              ),
              TitleWithMoreBtn(
                title: "Big Products",
                press: () {
                  print("pressed");
                },
              ),
              GridProduct(
                name: "bigProducts",
                front: widget.front,
              ),
              TitleWithMoreBtn(
                title: "Latest Products",
                press: () {
                  print("pressed");
                },
              ),
              ImageCard(
                name: "latestProducts",
                front: widget.front,
              ),
              TitleWithMoreBtn(
                title: "Top Products",
                press: () {
                  print("pressed");
                },
              ),
              GridProduct(
                name: "topProducts",
                front: widget.front,
              ),
              TitleWithMoreBtn(
                title: "Hot Products",
                press: () {
                  print("pressed");
                },
              ),
              DetailImageCard(
                name: "hotProducts",
                front: widget.front,
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
