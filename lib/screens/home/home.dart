import 'package:flutter/material.dart';
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
  ApiFront data;

  @override
  void initState() {
    super.initState();
    _loading = true;

    Services.fetch().then((front) {
      setState(() {
        data = front;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(front: data),
      body: (_loading)
          ? Center(child: CircularProgressIndicator())
          : HomeBody(front: data),
    );
  }
}
