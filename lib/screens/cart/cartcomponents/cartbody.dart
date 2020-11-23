import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/cartmodel.dart';
import 'package:sparknp/screens/cart/cartcomponents/title_text.dart';
import 'package:sparknp/services/cartservice.dart';

class CartBody extends StatefulWidget {
  final Cart cart;
  const CartBody({Key key, this.cart}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List _cartList;

  @override
  void initState() {
    super.initState();
    setState(() {
      _cartList = widget.cart.carts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: (widget.cart.carts.length == 0)
            ? Center(
                child: Text("No Items in Cart"),
              )
            : Column(
                children: <Widget>[
                  _item(widget.cart),
                  Divider(
                    thickness: 1,
                    height: 70,
                  ),
                  _price(),
                  SizedBox(height: 30),
                  _submitButton(context),
                ],
              ),
      ),
    );
  }

  Widget _item(Cart model) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 450,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _cartList.length,
        itemBuilder: (context, index) {
          dynamic product = _cartList[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, details, arguments: product);
              },
              child: Container(
                width: size.width * 0.8,
                height: 80,
                child: Column(children: [
                  Expanded(
                    child: ListTile(
                      title: TitleText(
                        text:
                            "Product ID : ${product.productId}    x${product.quantity}",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: Row(children: <Widget>[
                        TitleText(
                          text: '\Rs ',
                          color: LightColor.red,
                          fontSize: 12,
                        ),
                        TitleText(
                          text: product.price.toString(),
                          fontSize: 14,
                        ),
                      ]),
                      trailing: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: LightColor.orange,
                        onPressed: () {
                          CartService.remove(product.productId).then((removed) {
                            _showDialog(context);
                          });
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(color: LightColor.background),
                        ),
                      ),
                    ),
                  ),
                ]),
              ));
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

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${widget.cart.carts.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: "Rs${widget.cart.totalPrice}",
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: TitleText(
            text: 'Next',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Future<void> _showDialog(context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Removed from Cart'),
      );
    },
  );
}
