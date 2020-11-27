import 'package:flutter/material.dart';

import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/services/frontservice.dart';

import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/screens/home/homecomponent/homebody.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/widgets/appbar/barbutton.dart';

import 'package:sparknp/services/storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading;
  ApiFront front;

  final TextEditingController _searchcontroller = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;

    FrontService.fetch().then((data) {
      secureStorage.readData('token').then((value) {
        setState(() {
          front = data;
          _token = value;
          _loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.mainColor,
        elevation: 0,
        iconTheme: IconThemeData(color: LightColor.textLightColor),
        actions: <Widget>[
          Row(children: [
            Container(
              width: size.width * 0.6,
              height: 40,
              decoration: BoxDecoration(
                color: LightColor.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _searchcontroller,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    )),
                onSubmitted: (value) {
                  print(_searchcontroller.text);
                  Navigator.pushNamed(context, search,
                      arguments: _searchcontroller.text);
                },
              ),
            ),
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
      drawer: MainDrawer(front: front),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : HomeBody(
              front: front,
            ),
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet, Check your connection.",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
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
}
