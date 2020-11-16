import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/screens/home/homecomponent/banners_ecommerce.dart';
import 'package:sparknp/screens/home/homecomponent/featured.dart';
import 'package:sparknp/screens/home/homecomponent/recommended.dart';
import 'package:sparknp/screens/home/homecomponent/sectiontitle.dart';
import 'package:sparknp/screens/home/homecomponent/test.dart';
import 'package:sparknp/constants.dart';

class Body extends StatelessWidget {
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
              Color(0xFFEEEEEE),
              Color(0xFFEEEEEE),
              Color(0xFFEEEEEE),
              Color(0xFFEEEEEE),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          )),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 13,
              ),
              child: Row(
                children: [
                  Container(
                    width: 270,
                    height: 40,
                    decoration: BoxDecoration(
                      color: LightColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "What are you looking for",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconBtnWithCounter(
                      svgSrc: "assets/Cart Icon.svg",
                      press: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, myOrders, (home) => true);
                      }),
                  IconBtnWithCounter(
                      svgSrc: "assets/Heart Icon.svg",
                      numOfitem: 5,
                      press: () {
                        print("pressed");
                      })
                ],
              ),
            ),
            Container(
              // height: 90,
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
            FeaturedProduct(),
            BannerScreen(),
            TitleWithMoreBtn(
              title: "Recommended",
              press: () {
                print("pressed");
              },
            ),
            Recomends(),
            TitleWithMoreBtn(
              title: "Top Sale",
              press: () {
                print("pressed");
              },
            ),
            FeaturedProduct(),
          ],
        ),
      ]),
    ));
  }
}
