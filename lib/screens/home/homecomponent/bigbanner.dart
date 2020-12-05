import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sparknp/model/frontjson.dart';

class Bigbanner extends StatefulWidget {
  final ApiFront apiFront;
  final String name;

  const Bigbanner({Key key, this.apiFront, this.name}) : super(key: key);

  @override
  _BigbannerState createState() => _BigbannerState();
}

class _BigbannerState extends State<Bigbanner> {
  String imgpath = "https://sparknp.com/assets/images/banners/";
  List _bannerList;
  @override
  void initState() {
    switch (widget.name) {
      case "smallbanner":
        return setState(() {
          _bannerList = widget.apiFront.topSmallBanners;
        });
      case "bigbanner":
        return setState(() {
          _bannerList = widget.apiFront.largeBanners;
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: (widget.name == "smallbanner") ? 180 : 250,
      child: CarouselSlider(
        autoPlay: true,
        enlargeCenterPage: true,
        items: _bannerList
            .map((item) => Container(
                  width: size.width,
                  height: (widget.name == "smallbanner") ? 180 : 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imgpath + item.photo))),
                ))
            .toList(),
      ),
    );
  }
}
