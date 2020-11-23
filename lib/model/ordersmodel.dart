// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
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
    this.tracks,
  });

  int id;
  String userId;
  String cart;
  String method;
  String shipping;
  String pickupLocation;
  String totalQty;
  String payAmount;
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
  String shippingCountry;
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
  String currencyValue;
  String shippingCost;
  String packingCost;
  String tax;
  String dp;
  dynamic payId;
  String vendorShippingId;
  String vendorPackingId;
  List<Track> tracks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        cart: json["cart"],
        method: json["method"],
        shipping: json["shipping"],
        pickupLocation: json["pickup_location"],
        totalQty: json["totalQty"],
        payAmount: json["pay_amount"],
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
        currencyValue: json["currency_value"],
        shippingCost: json["shipping_cost"],
        packingCost: json["packing_cost"],
        tax: json["tax"],
        dp: json["dp"],
        payId: json["pay_id"],
        vendorShippingId: json["vendor_shipping_id"],
        vendorPackingId: json["vendor_packing_id"],
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
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
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    this.id,
    this.orderId,
    this.title,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String orderId;
  String title;
  String text;
  DateTime createdAt;
  DateTime updatedAt;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        orderId: json["order_id"],
        title: json["title"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "title": title,
        "text": text,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
