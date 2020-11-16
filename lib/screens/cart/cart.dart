import 'package:flutter/material.dart';

import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/widgets/appbar/appbar.dart';
import 'package:sparknp/screens/cart/cartcomponents/cartbody.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      body: CartBody(),
    );
  }
}
