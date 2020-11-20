import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

class BannerCard extends StatefulWidget {
  final ApiFront front;

  const BannerCard({Key key, this.front}) : super(key: key);

  @override
  _BannerCardState createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> {
  String imgpath = "https://sparknp.com/assets/images/banners/";

  String photo;
  List _bannerList;

  @override
  void initState() {
    super.initState();
    setState(() {
      _bannerList = widget.front.topSmallBanners;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
          itemCount: _bannerList.length >= 5 ? 5 : _bannerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            dynamic banner = _bannerList[index];
            return GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, details, arguments: product);
              },
              child: Column(children: <Widget>[
                Container(
                  width: 240,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imgpath + banner.photo),
                    ),
                  ),
                ),
              ]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
