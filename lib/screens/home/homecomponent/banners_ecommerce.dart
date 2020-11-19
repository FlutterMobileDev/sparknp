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
            image:NetworkImage('https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60') ,
            fit: BoxFit.fill,
          ),
        ),

      );
  }

}