import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/model/ordersmodel.dart';
import 'package:sparknp/services/ordersservice.dart';
import 'package:sparknp/services/storage.dart';
import 'package:sparknp/screens/orders/orderscomponents/ordersbody.dart';
import 'package:sparknp/widgets/appbar.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Orders orders;
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;
    OrdersService.list(_token).then((data) {
      secureStorage.readData('token').then((value) {
        _token = value;
        OrdersService.list(_token).then((data) {
          setState(() {
            orders = data;
            _loading = false;
          });
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
          : OrdersBody(orders: orders),
    );
  }
}
