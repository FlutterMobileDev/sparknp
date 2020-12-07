import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/cartmodel.dart';
import 'package:sparknp/model/productmodel.dart';
import 'package:sparknp/services/cartservice.dart';
import 'package:sparknp/services/productservice.dart';

import 'package:sparknp/services/storage.dart';

class CartBody extends StatefulWidget {
  final Cart cart;
  const CartBody({Key key, this.cart}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  String imgpath = "https://sparknp.com/assets/images/thumbnails/";
  List _cartList;
  List _cartList1;
  bool _loading;
  double price;
  int x;
  Cart cart1;

  final SecureStorage secureStorage = SecureStorage();
  String _token;
  List<String> _productName = [];
  List _productImage = [];

  ProductDetails _product;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) async {
      int n = widget.cart.carts.length;
      for (int i = 1; i <= n; i++) {
        await ProductService.fetch(widget.cart.carts[i - 1].productId)
            .then((value) {
          _product = value;
          _productImage.add(_product.product.thumbnail);
          _productName.add(_product.product.name);
        });
      }
      setState(() {
        _token = value;
        _cartList = widget.cart.carts;
        _cartList1 = widget.cart.carts;
        _loading = false;
      });
      secureStorage.writeData("totalPrice", widget.cart.totalPrice.toString());
      secureStorage.writeData("quantity", widget.cart.carts.length.toString());
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
              child: (widget.cart.carts.length == 0)
                  ? Container(
                      height: 400,
                      child: Center(
                        child: Text("No Items in Cart"),
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        _item(widget.cart),
                        Divider(
                          thickness: 1,
                          height: 70,
                        ),
                        _price(),
                        // SizedBox(height: 30),
                        _submitButton(context),
                      ],
                    ),
            ),
          );
  }

  Widget _item(Cart model) {
    return Container(
      width: AppTheme.fullWidth(context) - 20,
      height: AppTheme.fullHeight(context) * 0.55,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        itemCount: _cartList.length,
        itemBuilder: (context, index) {
          dynamic product = _cartList[index];
          return Dismissible(
            key: Key(cart),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              CartService.destroy(_token, product.productId).then((removed) {
                _addsubtract();
                Navigator.popAndPushNamed(context, cart);
              });
            },
            child: Container(
              width: AppTheme.fullWidth(context),
              height: 100,
              child: Column(children: [
                Expanded(
                  child: ListTile(
                    leading: Image.network(
                      imgpath + _productImage[index].toString(),
                      height: 200,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "${_productName[index]}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.fade,
                    ),
                    subtitle: Row(children: <Widget>[
                      TitleText(
                        text: '\Rs ',
                        color: LightColor.red,
                        fontSize: 14,
                      ),
                      TitleText(
                        text: product.price.toString(),
                        fontSize: 14,
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      minWidth: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: LightColor.orange,
                      onPressed: () {
                        CartService.remove(_token, product.productId)
                            .then((removed) {
                          _addsubtract();
                        });
                      },
                      child: Text(
                        "-",
                        style: TextStyle(color: LightColor.background),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Text(
                        "x${(_cartList[index].quantity == null) ? product.quantity : _cartList1[index].quantity}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    FlatButton(
                      minWidth: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: LightColor.orange,
                      onPressed: () {
                        CartService.add(_token, product.productId)
                            .then((removed) {
                          _addsubtract();
                        });
                      },
                      child: Text(
                        "+",
                        style: TextStyle(color: LightColor.background),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
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

  Widget _price() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${widget.cart.carts.length} Items',
            style: GoogleFonts.muli(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: LightColor.grey),
            overflow: TextOverflow.fade,
          ),
          Text(
            "Total: Rs ${(price != null) ? price : widget.cart.totalPrice}",
            style: TextStyle(
              fontSize: 18,
            ),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          if (widget.cart.carts.isNotEmpty) {
            Navigator.pushNamed(context, processCart);
          }
        },
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

  _addsubtract() {
    secureStorage.readData('token').then((value) {
      _token = value;
      CartService.list(_token).then((data) {
        setState(() {
          cart1 = data;
          _cartList1 = cart1.carts;
          price = cart1.totalPrice;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
