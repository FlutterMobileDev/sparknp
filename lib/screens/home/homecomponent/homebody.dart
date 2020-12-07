import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/home/homecomponent/bigbanner.dart';

import 'package:sparknp/screens/home/homecomponent/imagecard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
import 'package:sparknp/screens/home/homecomponent/gridview.dart';
import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';

class HomeBody extends StatefulWidget {
  final ApiFront front;
  const HomeBody({
    Key key,
    this.front,
  }) : super(key: key);

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
              Bigbanner(
                apiFront: widget.front,
                name: "sliders",
                y: 1,
              ),
              TitleWithMoreBtn(
                name: "Featured Products",
                front: widget.front,
              ),
              ImageCard(
                name: "featureProducts",
                front: widget.front,
              ),
              SizedBox(
                height: 8,
              ),
              TitleWithMoreBtn(
                name: "Trending Products",
                front: widget.front,
              ),
              DetailImageCard(
                name: "trendingProducts",
                front: widget.front,
              ),
              Bigbanner(
                apiFront: widget.front,
                name: "bigbanner",
                x: 1,
              ),
              TitleWithMoreBtn(
                name: "Sale Products",
                front: widget.front,
              ),
              ImageCard(
                name: "saleProducts",
                front: widget.front,
              ),
              SizedBox(
                height: 8,
              ),
              TitleWithMoreBtn(
                name: "Best Products",
                front: widget.front,
              ),
              DetailImageCard(
                name: "bestProducts",
                front: widget.front,
              ),
              Bigbanner(
                apiFront: widget.front,
                name: "smallbanner",
                x: 1,
              ),
              TitleWithMoreBtn(
                name: "Big Products",
                front: widget.front,
              ),
              GridProduct(
                name: "bigProducts",
                front: widget.front,
              ),
              SizedBox(
                height: 8,
              ),
              TitleWithMoreBtn(
                name: "Latest Products",
                front: widget.front,
              ),
              ImageCard(
                name: "latestProducts",
                front: widget.front,
              ),
              Bigbanner(
                apiFront: widget.front,
                name: "smallbanner",
                x: 1,
              ),
              TitleWithMoreBtn(
                name: "Top Products",
                front: widget.front,
              ),
              GridProduct(
                name: "topProducts",
                front: widget.front,
              ),
              SizedBox(
                height: 8,
              ),
              TitleWithMoreBtn(
                name: "Hot Products",
                front: widget.front,
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
