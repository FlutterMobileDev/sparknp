import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlideScreen extends StatefulWidget {
  final product;
  const ImageSlideScreen({Key key, this.product}) : super(key: key);
  @override
  _ImageSlideScreenState createState() => _ImageSlideScreenState();
}

class _ImageSlideScreenState extends State<ImageSlideScreen> {
  String imgpath = "www.sparknp.com/assets/images/galleries/";
  int _current = 0;
  List imgList;

  @override
  void initState() {
    super.initState();
    print(widget.product["thumbnail"]);
    (widget.product["galleries"] == null)
        ? setState(() {
            imgList.add(widget.product["thumbnail"]);
          })
        : setState(() {
            imgList.add(widget.product["galleries"]);
          });
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            initialPage: 0,
            height: 300,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: imgList.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Image.network(
                      imageUrl.toString(),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 275, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.blue[900] : Colors.white,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
