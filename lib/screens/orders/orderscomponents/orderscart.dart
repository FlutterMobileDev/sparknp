import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/services/productservice.dart';

import 'package:sparknp/services/storage.dart';
import 'package:sparknp/widgets/appbar.dart';

class OrdersCart extends StatefulWidget {
  final cart;

  const OrdersCart({Key key, this.cart}) : super(key: key);
  @override
  _OrdersCartState createState() => _OrdersCartState();
}

class _OrdersCartState extends State<OrdersCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: OrderCartBody(
        cart: widget.cart,
      ),
    );
  }
}

class OrderCartBody extends StatefulWidget {
  final cart;
  const OrderCartBody({Key key, this.cart}) : super(key: key);

  @override
  _OrderCartBodyState createState() => _OrderCartBodyState();
}

class _OrderCartBodyState extends State<OrderCartBody> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";
  List _cartList;
  bool _loading;

  final SecureStorage secureStorage = SecureStorage();
  List<String> _productName = [];
  List _productImage = [];

  var _product;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) async {
      int n = widget.cart.length;
      for (int i = 1; i <= n; i++) {
        await ProductService.fetch(widget.cart[i - 1]["product_id"])
            .then((value) {
          _product = value;
          _productImage.add(_product["product"]["thumbnail"]);
          _productName.add(_product["product"]["name"]);
        });
      }
      setState(() {
        _cartList = widget.cart;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            padding: AppTheme.padding,
            child: SingleChildScrollView(
              child: (widget.cart.length == 0)
                  ? Container(
                      height: 400,
                      child: Center(
                        child: Text("No Items in Cart"),
                      ),
                    )
                  : _item(widget.cart),
            ),
          );
  }

  Widget _item(var model) {
    return Container(
      width: AppTheme.fullWidth(context) - 20,
      height: AppTheme.fullHeight(context) * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _cartList.length,
        itemBuilder: (context, index) {
          dynamic product = _cartList[index];
          return Container(
            width: AppTheme.fullWidth(context),
            height: AppTheme.fullWidth(context) * 0.2,
            child: ListTile(
              leading: Image.network(
                imgpath + _productImage[index].toString(),
                height: 200,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                "${_productName[index]}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                overflow: TextOverflow.fade,
              ),
              subtitle: Row(children: <Widget>[
                TitleText(
                  text: '\Rs ',
                  color: LightColor.red,
                  fontSize: 14,
                ),
                TitleText(
                  text: product["price"].toString(),
                  fontSize: 14,
                ),
                Spacer(),
                TitleText(
                  text: "x ${product["quantity"].toString()}",
                  fontSize: 14,
                ),
              ]),
            ),
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
