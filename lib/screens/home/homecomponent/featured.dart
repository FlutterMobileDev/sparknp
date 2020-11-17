// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:sparknp/router.dart';
import 'package:sparknp/model/product.dart';
import 'package:sparknp/screens/home/homecomponent/cardview.dart';

String token =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiMjVhMWJkNGFiZDVlMTQ4Nzc0MGQ1NmQ0MDk0YTk2ZTUzYmRmZmYyNGYyNTJhNzJlZjA3ZmQwYmMwZDgxMjMxMjFlODc5NWI0ZDUzNGFiMmEiLCJpYXQiOjE2MDU1OTkxNzQsIm5iZiI6MTYwNTU5OTE3NCwiZXhwIjoxNjM3MTM1MTczLCJzdWIiOiI0MiIsInNjb3BlcyI6W119.MX24ik_r22miWaBLA1T5lVdmP9S-3UHSWvqB1JSWykEu784HGcXwRuhIWPcnzQ9T0AAl4zW-AaRa7AoKXBOHVXDLzQ07tGy5j7UFRAO_QJVqk75ZcB4AlgL_TMEm0xk_3DDtes79nLslp_KStk2TNXdcJdQuJ4V09ictMLiI0lHPNkn1taVISM6KbSLgXOQWsaitd74FKbXojhhefLgcHqja6nCyNpZctiKAkqhWNjxQMcE6ZOx5ftKpyzHBSjU5VD7-HW80gWi3HefpDNb5psRGgXqYEhRqohj9vujh9PDEg4jb8Ka3V3u-v9yKMnkVTdX-sDXysPxE4W4uH1cggHVKlYApPeWDTGXjfCK0Wr_ZdOg3qtQByMrkVSrKq74oyPDFvK--cQK7I-kDXR3-GLh2_oLWmJw6644hR8jd3MzfFZr3geq3NF77VaEDJ3OWZv-D0bIIug34qxhd3JaigSlCX-iXSRh6sUQfEBWMICYDIm7TgGbx0vgyrVayDczZI0bcasDsdgT_KVBo24EguJFSwFgjL0SCVyy1vjVCJ3BhPALhWwMe2RskeDfYCa2mpUClKDN4TddPInyJVBS9j3rTIseCJ4L2KXmJD3HT0hyRu08FaNux4LI3O10VXNBQFPXeYPfVrvAuNXNV_stHG41GKsjI4f3ZAv0dcy5q4nU";
String imgpath = "https://sparknp.com/assets/images/thumbnails/";

class FeaturedProduct extends StatefulWidget {
  @override
  _FeaturedProductState createState() => _FeaturedProductState();
  const FeaturedProduct({
    Key key,
  }) : super(key: key);
}

class _FeaturedProductState extends State<FeaturedProduct> {
  String thumbnail;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeatureCard(
            image: thumbnail,
            press: () {
              // Navigator.pushNamed(context, details);
            },
          ),
          FeatureCard(
            image: thumbnail,
            press: () {},
          ),
          FeatureCard(
            image: thumbnail,
            press: () {},
          ),
          FeatureCard(
            image: thumbnail,
            press: () {},
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetch() async {
    final response = await http.get(
      'https://sparknp.com/api/products/195',
      // headers: {HttpHeaders.authorizationHeader: token.toString()}
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var product = data["product"];

      // Product product = Product.fromJson(jsonDecode(response.body));
      print(product["name"]);
      print(imgpath + product["thumbnail"]);
      setState(() {
        thumbnail = imgpath + product["thumbnail"];
      });
    } else {
      throw Exception('error');
    }
  }
}
