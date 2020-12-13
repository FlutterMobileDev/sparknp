import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlideScreen extends StatefulWidget {
  final product;
  const ImageSlideScreen(this.product);
  @override
  _ImageSlideScreenState createState() => _ImageSlideScreenState();
}

class _ImageSlideScreenState extends State<ImageSlideScreen> {
  String galleryPath = "https://www.sparknp.com/assets/images/galleries/";
  String thumbPath = "https://sparknp.com/assets/images/thumbnails/";
  int _current = 0;
  List<String> imgList = [];

  bool hasGallery;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.product["galleries"].length; i++) {
      imgList.add(widget.product["galleries"][i]["photo"]);
    }
    (widget.product["galleries"] == null)
        ? hasGallery = true
        : hasGallery = false;
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
    return (!hasGallery)
        ? Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(thumbPath + widget.product["thumbnail"]),
              ),
            ),
          )
        : Container(
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
                            image: DecorationImage(
                              image: NetworkImage(
                                  galleryPath + imageUrl.toString()),
                            ),
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
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.blue[900]
                              : Colors.white,
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
