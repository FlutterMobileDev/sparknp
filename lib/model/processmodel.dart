// To parse this JSON data, do
//
//     final process = processFromJson(jsonString);

import 'dart:convert';

Process processFromJson(String str) => Process.fromJson(json.decode(str));

String processToJson(Process data) => json.encode(data.toJson());

class Process {
  Process({
    this.personalName,
    this.personalEmail,
    this.shipping,
    this.pickupLocation,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.customerCountry,
    this.city,
    this.zip,
    this.shippingName,
    this.shippingEmail,
    this.shippingPhone,
    this.shippingAddress,
    this.shippingCountry,
    this.shippingCity,
    this.shippingZip,
    this.orderNotes,
    this.method,
    this.shippingCost,
    this.packingCost,
    this.dp,
    this.tax,
    this.totalQty,
    this.vendorShippingId,
    this.vendorPackingId,
    this.total,
    this.couponCode,
    this.couponDiscount,
    this.couponId,
    this.userId,
  });

  String personalName;
  String personalEmail;
  String shipping;
  String pickupLocation;
  String name;
  String phone;
  String email;
  String address;
  String customerCountry;
  String city;
  String zip;
  dynamic shippingName;
  dynamic shippingEmail;
  dynamic shippingPhone;
  dynamic shippingAddress;
  dynamic shippingCountry;
  dynamic shippingCity;
  dynamic shippingZip;
  dynamic orderNotes;
  String method;
  String shippingCost;
  String packingCost;
  String dp;
  String tax;
  String totalQty;
  String vendorShippingId;
  String vendorPackingId;
  String total;
  dynamic couponCode;
  dynamic couponDiscount;
  dynamic couponId;
  String userId;

  factory Process.fromJson(Map<String, dynamic> json) => Process(
        personalName: json["personal_name"],
        personalEmail: json["personal_email"],
        shipping: json["shipping"],
        pickupLocation: json["pickup_location"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        customerCountry: json["customer_country"],
        city: json["city"],
        zip: json["zip"],
        shippingName: json["shipping_name"],
        shippingEmail: json["shipping_email"],
        shippingPhone: json["shipping_phone"],
        shippingAddress: json["shipping_address"],
        shippingCountry: json["shipping_country"],
        shippingCity: json["shipping_city"],
        shippingZip: json["shipping_zip"],
        orderNotes: json["order_notes"],
        method: json["method"],
        shippingCost: json["shipping_cost"],
        packingCost: json["packing_cost"],
        dp: json["dp"],
        tax: json["tax"],
        totalQty: json["totalQty"],
        vendorShippingId: json["vendor_shipping_id"],
        vendorPackingId: json["vendor_packing_id"],
        total: json["total"],
        couponCode: json["coupon_code"],
        couponDiscount: json["coupon_discount"],
        couponId: json["coupon_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "personal_name": personalName,
        "personal_email": personalEmail,
        "shipping": shipping,
        "pickup_location": pickupLocation,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "customer_country": customerCountry,
        "city": city,
        "zip": zip,
        "shipping_name": shippingName,
        "shipping_email": shippingEmail,
        "shipping_phone": shippingPhone,
        "shipping_address": shippingAddress,
        "shipping_country": shippingCountry,
        "shipping_city": shippingCity,
        "shipping_zip": shippingZip,
        "order_notes": orderNotes,
        "method": method,
        "shipping_cost": shippingCost,
        "packing_cost": packingCost,
        "dp": dp,
        "tax": tax,
        "totalQty": totalQty,
        "vendor_shipping_id": vendorShippingId,
        "vendor_packing_id": vendorPackingId,
        "total": total,
        "coupon_code": couponCode,
        "coupon_discount": couponDiscount,
        "coupon_id": couponId,
        "user_id": userId,
      };
}
