import 'package:flutter/material.dart';

import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/services/storage.dart';

import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic product;
  const DetailsScreen(this.product);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {
            if (_token != null) {
              CartService.add(_token, widget.product.id).then(
                (added) {
                  _showDialog(context, true);
                },
              );
            } else {
              _showDialog(context, false);
            }
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

Future<void> _showDialog(context, added) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return added
            ? AlertDialog(
                title: Text('Added to cart'),
              )
            : AlertDialog(
                title: Text('Please Log In'),
              );
      });
}
