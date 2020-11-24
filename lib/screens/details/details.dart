import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/services/storage.dart';

import 'package:sparknp/screens/details/detailscomponents/detailsbody.dart';

import 'package:sparknp/widgets/appbar/barbutton.dart';

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
            appBar: AppBar(
              backgroundColor: LightColor.mainColor,
              elevation: 0,
              iconTheme: IconThemeData(color: LightColor.textLightColor),
              actions: <Widget>[
                Row(children: [
                  SizedBox(
                    width: 5,
                  ),
                  IconBtnWithCounter(
                      svgSrc: "assets/Cart Icon.svg",
                      // numOfitem: cart.carts,
                      press: () {
                        if (_token != null) {
                          Navigator.pushNamed(
                            context,
                            cart,
                          );
                        } else {
                          _showDialog(context, "Please Log In");
                        }
                      }),
                  IconBtnWithCounter(
                      svgSrc: "assets/Heart Icon.svg",
                      // numOfitem: 5,
                      press: () {
                        if (_token != null) {
                          Navigator.pushNamed(
                            context,
                            wishlist,
                          );
                        } else {
                          _showDialog(context, "Please Log In");
                        }
                      }),
                  SizedBox(width: defaultPadding / 2)
                ])
              ],
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  if (_token != null) {
                    CartService.add(_token, widget.product.id).then(
                      (added) {
                        _showDialog(context, "Added to Cart");
                      },
                    );
                  } else {
                    _showDialog(context, "Please Log In");
                  }
                }),
            body: DetailsBody(widget.product),
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
