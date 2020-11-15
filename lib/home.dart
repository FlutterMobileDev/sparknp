import 'package:flutter/material.dart';

import 'package:sparknp/nav/drawer.dart';
import 'package:sparknp/homecomponent/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: Body(),
    );
  }
}
