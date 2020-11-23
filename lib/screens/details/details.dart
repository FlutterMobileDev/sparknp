import 'package:flutter/material.dart';

import 'package:sparknp/services/cartservice.dart';

import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';

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
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {
            CartService.add(widget.product.id).then(
              (added) {
                _showDialog(context);
              },
            );
          }),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 125, 0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.blue[300],
            textColor: Colors.white,
            child: Text(
              "Buy Now",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            onPressed: () {
              print("presed");
            },
          ),
        ),
      ],
      body: DetailsBody(widget.product),
    );
  }
}

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Added to cart'),
      );
    },
  );
}
