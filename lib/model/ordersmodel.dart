// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.status,
    this.orders,
  });

  bool status;
  List<Order> orders;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.userId,
    this.cart,
    this.method,
    this.shipping,
    this.pickupLocation,
    this.totalQty,
    this.payAmount,
    this.txnid,
    this.chargeId,
    this.orderNumber,
    this.paymentStatus,
    this.customerEmail,
    this.customerName,
    this.customerCountry,
    this.customerPhone,
    this.customerAddress,
    this.customerCity,
    this.customerZip,
    this.shippingName,
    this.shippingCountry,
    this.shippingEmail,
    this.shippingPhone,
    this.shippingAddress,
    this.shippingCity,
    this.shippingZip,
    this.orderNote,
    this.couponCode,
    this.couponDiscount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.affilateUser,
    this.affilateCharge,
    this.currencySign,
    this.currencyValue,
    this.shippingCost,
    this.packingCost,
    this.tax,
    this.dp,
    this.payId,
    this.vendorShippingId,
    this.vendorPackingId,
  });

  int id;
  int userId;
  String cart;
  String method;
  String shipping;
  String pickupLocation;
  String totalQty;
  double payAmount;
  dynamic txnid;
  dynamic chargeId;
  String orderNumber;
  String paymentStatus;
  String customerEmail;
  String customerName;
  String customerCountry;
  String customerPhone;
  String customerAddress;
  String customerCity;
  String customerZip;
  dynamic shippingName;
  dynamic shippingCountry;
  dynamic shippingEmail;
  dynamic shippingPhone;
  dynamic shippingAddress;
  dynamic shippingCity;
  dynamic shippingZip;
  dynamic orderNote;
  dynamic couponCode;
  dynamic couponDiscount;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic affilateUser;
  dynamic affilateCharge;
  String currencySign;
  double currencyValue;
  int shippingCost;
  int packingCost;
  int tax;
  int dp;
  dynamic payId;
  int vendorShippingId;
  int vendorPackingId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        cart: json["cart"],
        method: json["method"],
        shipping: json["shipping"],
        pickupLocation: json["pickup_location"],
        totalQty: json["totalQty"],
        payAmount: json["pay_amount"].toDouble(),
        txnid: json["txnid"],
        chargeId: json["charge_id"],
        orderNumber: json["order_number"],
        paymentStatus: json["payment_status"],
        customerEmail: json["customer_email"],
        customerName: json["customer_name"],
        customerCountry: json["customer_country"],
        customerPhone: json["customer_phone"],
        customerAddress: json["customer_address"],
        customerCity: json["customer_city"],
        customerZip: json["customer_zip"],
        shippingName: json["shipping_name"],
        shippingCountry: json["shipping_country"],
        shippingEmail: json["shipping_email"],
        shippingPhone: json["shipping_phone"],
        shippingAddress: json["shipping_address"],
        shippingCity: json["shipping_city"],
        shippingZip: json["shipping_zip"],
        orderNote: json["order_note"],
        couponCode: json["coupon_code"],
        couponDiscount: json["coupon_discount"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        affilateUser: json["affilate_user"],
        affilateCharge: json["affilate_charge"],
        currencySign: json["currency_sign"],
        currencyValue: json["currency_value"].toDouble(),
        shippingCost: json["shipping_cost"],
        packingCost: json["packing_cost"],
        tax: json["tax"],
        dp: json["dp"],
        payId: json["pay_id"],
        vendorShippingId: json["vendor_shipping_id"],
        vendorPackingId: json["vendor_packing_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "cart": cart,
        "method": method,
        "shipping": shipping,
        "pickup_location": pickupLocation,
        "totalQty": totalQty,
        "pay_amount": payAmount,
        "txnid": txnid,
        "charge_id": chargeId,
        "order_number": orderNumber,
        "payment_status": paymentStatus,
        "customer_email": customerEmail,
        "customer_name": customerName,
        "customer_country": customerCountry,
        "customer_phone": customerPhone,
        "customer_address": customerAddress,
        "customer_city": customerCity,
        "customer_zip": customerZip,
        "shipping_name": shippingName,
        "shipping_country": shippingCountry,
        "shipping_email": shippingEmail,
        "shipping_phone": shippingPhone,
        "shipping_address": shippingAddress,
        "shipping_city": shippingCity,
        "shipping_zip": shippingZip,
        "order_note": orderNote,
        "coupon_code": couponCode,
        "coupon_discount": couponDiscount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "affilate_user": affilateUser,
        "affilate_charge": affilateCharge,
        "currency_sign": currencySign,
        "currency_value": currencyValue,
        "shipping_cost": shippingCost,
        "packing_cost": packingCost,
        "tax": tax,
        "dp": dp,
        "pay_id": payId,
        "vendor_shipping_id": vendorShippingId,
        "vendor_packing_id": vendorPackingId,
      };
}
