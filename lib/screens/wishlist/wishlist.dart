import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';
import 'package:sparknp/screens/wishlist/wishlistcomponents/wishlistbody.dart';
import 'package:sparknp/widgets/appbar.dart';

class WishlistScreen extends StatefulWidget {
  final front;

  const WishlistScreen({Key key, this.front}) : super(key: key);
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  var wishlist;
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
          : WishlistService.list(_token).then((data) {
              setState(() {
                wishlist = data;
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
          : (!_loggedIn)
              ? Center(child: _buildSignInBtn(context))
              : WishlistBody(
                  front: widget.front,
                  wishlist: wishlist,
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
