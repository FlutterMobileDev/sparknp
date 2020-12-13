import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/model/screenarguments.dart';

class Bigbanner extends StatefulWidget {
  final front;
  final String name;
  final String name1;
  final int x;
  final int y;

  const Bigbanner({Key key, this.front, this.name, this.x, this.y, this.name1})
      : super(key: key);

  @override
  _BigbannerState createState() => _BigbannerState();
}

class _BigbannerState extends State<Bigbanner> {
  String imgpath = "https://sparknp.com/assets/images/banners/";
  String im1 = "https://sparknp.com/assets/images/sliders/";
  List _bannerList;
  @override
  void initState() {
    switch (widget.name) {
      case "smallbanner":
        return setState(() {
          _bannerList = widget.front["top_small_banners"];
        });
      case "bigbanner":
        return setState(() {
          _bannerList = widget.front["large_banners"];
        });
      case "sliders":
        return setState(() {
          _bannerList = widget.front["sliders"];
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: (widget.x == 1) ? size.width * 0.3 : size.width * 0.5,
      child: CarouselSlider(
        autoPlay: true,
        enlargeCenterPage: true,
        items: _bannerList
            .map((item) => GestureDetector(
                  onTap: () {
                    print("pressed");
                    Navigator.pushNamed(
                      context,
                      more,
                      arguments: ScreenArguments(
                        name: widget.name1,
                        front: widget.front,
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Container(
                      width: size.width,
                      height:
                          (widget.x == 1) ? size.width * 0.3 : size.width * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage((widget.y == 1)
                                  ? im1 + item["photo"]
                                  : imgpath + item["photo"]))),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
