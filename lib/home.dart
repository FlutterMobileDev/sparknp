import 'package:flutter/material.dart';

import 'drawer.dart';
import 'homecomponent/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Body(),
    );
  }
}
