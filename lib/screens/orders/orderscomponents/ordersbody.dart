import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/ordersmodel.dart';
import 'package:sparknp/screens/orders/orderscomponents/title_text.dart';

class OrdersBody extends StatefulWidget {
  final Orders orders;
  const OrdersBody({Key key, this.orders}) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  List _trackList;

  @override
  void initState() {
    super.initState();
    setState(() {
      _trackList = widget.orders.data.tracks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: (widget.orders.data.tracks.length == 0)
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

  Widget _item(Orders model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 450,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _trackList.length,
        itemBuilder: (context, index) {
          dynamic track = _trackList[index];
          return Container(
            width: size.width * 0.8,
            height: 80,
            child: Column(children: [
              Expanded(
                child: ListTile(
                  title: TitleText(
                    text: "Order ID : ${track.orderId}",
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
                      text: track.title,
                      fontSize: 14,
                    ),
                  ]),
                  trailing: Text("Rs ${widget.orders.data.payAmount}"),
                ),
              ),
            ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            height: 70,
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
