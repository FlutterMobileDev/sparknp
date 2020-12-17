import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/screens/cart/cartcomponents/cartbody.dart';

import 'package:sparknp/services/storage.dart';

import 'package:sparknp/widgets/appbar.dart';

class CartScreen extends StatefulWidget {
  final front;
  final double currency;

  const CartScreen({Key key, this.front, this.currency}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cart;
  bool _loading;
  bool _loggedIn;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      _token = value;
      (_token == null)
          ? setState(() {
              _loggedIn = false;
              _loading = false;
            })
          : setState(() {
              _loggedIn = true;
              _loading = false;
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: (_loading)
          ? Center(child: CircularProgressIndicator())
          : (!_loggedIn)
              ? Center(child: _buildSignInBtn(context))
              : FutureBuilder(
                  future: CartService.list(_token),
                  // ignore: missing_return
                  builder: (BuildContext context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        return (snapshot.hasError)
                            ? Center(
                                child: Text(
                                  "Connect to the Internet",
                                  style: AppTheme.h1Style,
                                ),
                              )
                            : CartBody(
                                cart: snapshot.data,
                                front: widget.front,
                                currency: widget.currency,
                              );
                      default:
                    }
                  },
                ),
    );
  }
}

Widget _buildSignInBtn(BuildContext context) {
  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width * 0.5,
    decoration: BoxDecoration(color: LightColor.background),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () {
        Navigator.pushNamed(context, login);
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue[300],
      child: Text(
        'Please Sign In',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
