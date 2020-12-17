import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic product;
  const DetailsScreen(this.product);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.primaryColor,
      ),
      body: DetailsBody(widget.product["id"]),
    );
  }
}
