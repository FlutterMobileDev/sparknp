import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';

import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/services/frontservice.dart';

import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/widgets/appbar/appbar.dart';
import 'package:sparknp/screens/home/homecomponent/homebody.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading;
  ApiFront front;

  bool iswificonnected = false;
  bool isInternetOn = true;

  @override
  void initState() {
    super.initState();
    _loading = true;

    getConnect();

    FrontService.fetch().then((data) {
      setState(() {
        front = data;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        drawer: MainDrawer(front: front),
        body: isInternetOn
            ? _loading
                ? Center(child: CircularProgressIndicator())
                : HomeBody(front: front)
            : buildAlertDialog());
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet, Check your connection.",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    }
  }
}
