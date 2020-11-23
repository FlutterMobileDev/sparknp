import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/model/ordersmodel.dart';
import 'package:sparknp/services/ordersservice.dart';
import 'package:sparknp/screens/orders/orderscomponents/ordersbody.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Orders orders;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    OrdersService.list().then((data) {
      setState(() {
        orders = data;
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
          : OrdersBody(orders: orders),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
      backgroundColor: LightColor.mainColor,
      elevation: 0,
      iconTheme: IconThemeData(color: LightColor.textLightColor),
      centerTitle: true,
      title: Text("My Orders"));
}