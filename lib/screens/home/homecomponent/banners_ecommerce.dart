import 'package:flutter/material.dart';

class BannerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(14),
        padding: EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: new DecorationImage(
            image:ExactAssetImage('assets/imagetest.jpg') ,
            fit: BoxFit.fill,
          ),
        ),

      );
  }

}