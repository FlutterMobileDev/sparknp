import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

String galleryPath = "https://www.sparknp.com/assets/images/galleries/";
String thumbPath = "https://sparknp.com/assets/images/thumbnails/";
List<String> imgList = [];

bool hasGallery;

var product;

class ImageSlideScreen extends StatefulWidget {
  final product;
  const ImageSlideScreen(this.product);
  @override
  _ImageSlideScreenState createState() => _ImageSlideScreenState();
}

class _ImageSlideScreenState extends State<ImageSlideScreen> {
  @override
  void initState() {
    super.initState();

    product = widget.product;

    for (int i = 0; i < widget.product["galleries"].length; i++) {
      imgList.add(widget.product["galleries"][i]["photo"]);
      print('i');
      print(i);
      // print(widget.product["galleries"].length);
      print(widget.product["galleries"][i]["photo"]);
      print(imgList.length);
    }
    (widget.product["galleries"].length != 0)
        ? setState(() {
            hasGallery = true;
          })
        : setState(() {
            hasGallery = false;
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
    return (!hasGallery)
        ? Container(
            height: AppTheme.fullHeight(context) * 0.3,
            child: ClipRect(
              child: PhotoView(
                imageProvider:
                    NetworkImage(thumbPath + widget.product["thumbnail"]),
                maxScale: PhotoViewComputedScale.covered * 2.0,
                minScale: PhotoViewComputedScale.contained * 0.8,
                initialScale: PhotoViewComputedScale.contained,
              ),
            ),
          )
        : Container(
            height: AppTheme.fullHeight(context) * 0.3,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(
                    galleryPath + widget.product["galleries"][index]["photo"],
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                );
              },
              itemCount: widget.product["galleries"].length,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes,
                  ),
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
    imgList = [];
  }
}
