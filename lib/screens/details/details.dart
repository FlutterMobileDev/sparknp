import 'package:flutter/material.dart';

import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/services/storage.dart';

import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

import 'package:sparknp/widgets/appbar.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic product;
  const DetailsScreen(this.product);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: buildAppBar(context),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  (_token != null)
                      ? CartService.add(_token, widget.product["id"]).then(
                          (added) {
                            _showDialog(context, "Added to Cart");
                          },
                        )
                      : _showDialog(context, "Please Log In");
                }),
            body: DetailsBody(widget.product["id"]),
          );
  }
}

Future<void> _showDialog(context, txt) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(txt),
        );
      });
}
