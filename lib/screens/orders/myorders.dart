import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/services/ordersservice.dart';
import 'package:sparknp/services/storage.dart';
import 'package:sparknp/screens/orders/orderscomponents/ordersbody.dart';
import 'package:sparknp/widgets/appbar.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var orders;
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      _token = value;
      setState(() {
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
          : FutureBuilder(
              future: OrdersService.list(_token),
              // ignore: missing_return
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    return (snapshot.hasError)
                        ? Center(
                            child: Text(
                              "Connect to the Internet",
                              style: AppTheme.h1Style,
                            ),
                          )
                        : OrdersBody(orders: snapshot.data);
                  default:
                }
              }),
    );
  }
}
