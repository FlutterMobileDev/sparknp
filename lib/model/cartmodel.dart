// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.status,
    this.carts,
    this.totalPrice,
  });

  bool status;
  List<CartElement> carts;
  double totalPrice;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        status: json["status"],
        carts: List<CartElement>.from(
            json["carts"].map((x) => CartElement.fromJson(x))),
        totalPrice: json["total_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "total_price": totalPrice,
      };
}

class CartElement {
  CartElement({
    this.id,
    this.productId,
    this.orderId,
    this.userId,
    this.status,
    this.price,
    this.size,
    this.color,
    this.quantity,
    this.sizeQuantity,
    this.sizePrice,
    this.sizeKey,
    this.stock,
    this.license,
    this.dp,
    this.cartKeys,
    this.cartValues,
    this.createdAt,
    this.updatedAt,
    this.cartKey,
  });

  int id;
  int productId;
  dynamic orderId;
  int userId;
  String status;
  double price;
  String size;
  String color;
  int quantity;
  dynamic sizeQuantity;
  dynamic sizePrice;
  dynamic sizeKey;
  dynamic stock;
  dynamic license;
  int dp;
  String cartKeys;
  String cartValues;
  DateTime createdAt;
  DateTime updatedAt;
  String cartKey;

  factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
        id: json["id"],
        productId: json["product_id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        status: json["status"],
        price: json["price"].toDouble(),
        size: json["size"],
        color: json["color"],
        quantity: json["quantity"],
        sizeQuantity: json["size_quantity"],
        sizePrice: json["size_price"],
        sizeKey: json["size_key"],
        stock: json["stock"],
        license: json["license"],
        dp: json["dp"],
        cartKeys: json["cart_keys"],
        cartValues: json["cart_values"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cartKey: json["cart_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "order_id": orderId,
        "user_id": userId,
        "status": status,
        "price": price,
        "size": size,
        "color": color,
        "quantity": quantity,
        "size_quantity": sizeQuantity,
        "size_price": sizePrice,
        "size_key": sizeKey,
        "stock": stock,
        "license": license,
        "dp": dp,
        "cart_keys": cartKeys,
        "cart_values": cartValues,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cart_key": cartKey,
      };
}
