import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/widgets/appbar/barbutton.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

import 'package:sparknp/services/storage.dart';

class Categories extends StatefulWidget {
  final Category category;

  const Categories({Key key, this.category}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
                          _showDialog(context);
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
                          _showDialog(context);
                        }
                      }),
                  SizedBox(width: defaultPadding / 2)
                ])
              ],
            ),
            body: CategoryBody(category: widget.category),
          );
  }
}

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please Log In'),
      );
    },
  );
}
