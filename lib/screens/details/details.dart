import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic product;
  final String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  const DetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              child: Container(
                height: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgpath + product.thumbnail),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Text(
                  //     "Mechanic Shop",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 28.0,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                            color: LightColor.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "8.4/85 reviews",
                          style: TextStyle(
                              color: LightColor.background, fontSize: 13.0),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        color: LightColor.background,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          print("pressed");
                        },
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: LightColor.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: LightColor.skyBlue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: LightColor.skyBlue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: LightColor.skyBlue,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: LightColor.skyBlue,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.purple,
                                      ),
                                    ],
                                  ),
                                  Text.rich(
                                    TextSpan(children: [
                                      TextSpan(text: "Shop Ratings")
                                    ]),
                                    style: TextStyle(
                                        color: LightColor.grey, fontSize: 12.0),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 15.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: LightColor.skyBlue,
                            textColor: LightColor.background,
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Features: this is empty. ${product.features}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        Text(
                          "Attributes: this is empty. ${product.attributes}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "DETAILs",
                  style: TextStyle(
                      color: LightColor.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
