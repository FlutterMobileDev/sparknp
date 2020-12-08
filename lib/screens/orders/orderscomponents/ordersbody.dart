import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';

import 'package:sparknp/model/screenarguments.dart';

class OrdersBody extends StatefulWidget {
  final orders;
  const OrdersBody({Key key, this.orders}) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  List _ordersList;

  @override
  void initState() {
    super.initState();
    setState(() {
      _ordersList = widget.orders["orders"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: (_ordersList.length == 0)
            ? Center(
                child: Text("No Orders"),
              )
            : Column(
                children: <Widget>[
                  _item(widget.orders),
                ],
              ),
      ),
    );
  }

  Widget _item(var model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 450,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _ordersList.length,
        itemBuilder: (context, index) {
          dynamic order = _ordersList[index];
          var cart = jsonDecode(order['cart']);
          return Container(
            width: size.width * 0.9,
            height: 60,
            child: Column(children: [
              Expanded(
                child: ListTile(
                  title: TitleText(
                    text: "Order ID : ${order['id'].toString()}",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(children: <Widget>[
                    TitleText(
                      text: 'Status: ',
                      color: LightColor.red,
                      fontSize: 14,
                    ),
                    TitleText(
                      text: cart[0]['status'].toString(),
                      fontSize: 14,
                    ),
                  ]),
                  onTap: () {
                    Navigator.pushNamed(context, cartBody,
                        arguments: ScreenArguments(cart: cart));
                  },
                ),
              ),
            ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
