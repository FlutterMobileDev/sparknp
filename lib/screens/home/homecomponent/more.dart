import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/screens/home/homecomponent/morecard.dart';

import 'package:sparknp/services/storage.dart';
import 'package:sparknp/widgets/appbar/barbutton.dart';

class MoreScreen extends StatefulWidget {
  final String name;
  final ApiFront front;

  const MoreScreen({Key key, this.name, this.front}) : super(key: key);
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
            body: ItemCard(
              name: widget.name,
              front: widget.front,
            ),
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
