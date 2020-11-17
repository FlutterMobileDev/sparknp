import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';

class FeatureCard extends StatefulWidget {
  @override
  _FeatureCardState createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";

  String thumbnail;
  List<BestProductElement> _featureproduct;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetch().then((welcome) {
      setState(() {
        _featureproduct = welcome.featureProducts;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (_loading)
        ? Container(
            margin: EdgeInsets.only(
              left: defaultPadding,
              top: defaultPadding / 2,
              bottom: defaultPadding / 2,
            ),
            width: size.width * 0.8,
            height: 185,
            child: Center(child: CircularProgressIndicator()),
          )
        : Container(
            width: size.width * 0.9,
            height: 185,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  BestProductElement featuredProduct = _featureproduct[index];
                  return GestureDetector(
                    onTap: () {
                      print("Details");
                    },
                    child: Container(
                      width: size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage(imgpath + featuredProduct.thumbnail),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }

  static Future<Welcome> fetch() async {
    try {
      final response = await http.get(
        'https://sparknp.com/api/front-data',
        // headers: {HttpHeaders.authorizationHeader: token.toString()}
      );
      if (response.statusCode == 200) {
        final Welcome welcome = welcomeFromJson(response.body);
        return welcome;
      } else {
        throw Exception('error hero');
      }
    } catch (e) {
      throw Exception('error here');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//Recommended card view
class RecomendCard extends StatelessWidget {
  const RecomendCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: defaultPadding,
          top: defaultPadding / 2,
          bottom: defaultPadding * 2.5,
        ),
        width: size.width * 0.6,
        child: Column(
          children: <Widget>[
            Container(
              height: 225,
              child: Image.asset(image.toString()),
            ),
            Container(
              padding: EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: LightColor.primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: LightColor.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: LightColor.primaryColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
