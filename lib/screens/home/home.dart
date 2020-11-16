import 'package:flutter/material.dart';

import 'package:sparknp/drawer.dart';
import 'package:sparknp/screens/home/homecomponent/homebody.dart';

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
