import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/services/frontservice.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/home/homecomponent/banners.dart';
import 'package:sparknp/screens/home/homecomponent/imagecard.dart';
import 'package:sparknp/screens/home/homecomponent/detailimagecard.dart';
import 'package:sparknp/screens/home/homecomponent/gridview.dart';
import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _loading;
  ApiFront data;

  @override
  void initState() {
    super.initState();
    _loading = true;

    Services.fetch().then((front) {
      setState(() {
        data = front;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (_loading)
        ? SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding / 2,
                bottom: defaultPadding / 2,
              ),
              width: size.width,
              height: 185,
              child: Center(child: CircularProgressIndicator()),
            ),
          )
        : SafeArea(
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
                    BannerScreen(),
                    TitleWithMoreBtn(
                      title: "Featured",
                      press: () {
                        print("pressed");
                      },
                    ),
                    ImageCard(
                      name: "featureProducts",
                      front: data,
                    ),
                    BannerScreen(),
                    TitleWithMoreBtn(
                      title: "Trending Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    DetailImageCard(
                      name: "trendingProducts",
                      front: data,
                    ),
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
                    ImageCard(
                      name: "saleProducts",
                      front: data,
                    ),
                    TitleWithMoreBtn(
                      title: "Best Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    DetailImageCard(
                      name: "bestProducts",
                      front: data,
                    ),
                    TitleWithMoreBtn(
                      title: "Big Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    GridProduct(
                      name: "bigProducts",
                      front: data,
                    ),
                    TitleWithMoreBtn(
                      title: "Latest Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    ImageCard(
                      name: "latestProducts",
                      front: data,
                    ),
                    TitleWithMoreBtn(
                      title: "Top Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    GridProduct(
                      name: "topProducts",
                      front: data,
                    ),
                    TitleWithMoreBtn(
                      title: "Hot Products",
                      press: () {
                        print("pressed");
                      },
                    ),
                    DetailImageCard(
                      name: "hotProducts",
                      front: data,
                    ),
                  ],
                ),
              ),
            ]),
          ));
  }
}
