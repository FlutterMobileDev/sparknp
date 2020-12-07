import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/model/cartmodel.dart';
import 'package:sparknp/router.dart';
import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/screens/cart/cartcomponents/cartbody.dart';

import 'package:sparknp/services/storage.dart';

import 'package:sparknp/widgets/appbar.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart cart;
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
          : CartService.list(_token).then((data) {
              setState(() {
                cart = data;
                _loggedIn = true;
                _loading = false;
              });
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: (_loading)
            ? Center(child: CircularProgressIndicator())
            : (_loggedIn)
                ? CartBody(cart: cart)
                : Center(child: _buildSignInBtn(context)));
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
