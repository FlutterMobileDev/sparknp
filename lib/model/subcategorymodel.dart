// To parse this JSON data, do
//
//     final subcat = subcatFromJson(jsonString);

import 'dart:convert';

Subcat subcatFromJson(String str) => Subcat.fromJson(json.decode(str));

String subcatToJson(Subcat data) => json.encode(data.toJson());

class Subcat {
  Subcat({
    this.status,
    this.products,
  });

  bool status;
  List<Product> products;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
        status: json["status"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.productType,
    this.affiliateLink,
    this.userId,
    this.categoryId,
    this.subcategoryId,
    this.childcategoryId,
    this.attributes,
    this.name,
    this.slug,
    this.photo,
    this.photoPath,
    this.thumbnail,
    this.file,
    this.size,
    this.sizeQty,
    this.sizePrice,
    this.color,
    this.price,
    this.previousPrice,
    this.details,
    this.stock,
    this.policy,
    this.status,
    this.views,
    this.tags,
    this.features,
    this.colors,
    this.productCondition,
    this.ship,
    this.isMeta,
    this.metaTag,
    this.metaDescription,
    this.youtube,
    this.type,
    this.license,
    this.licenseQty,
    this.link,
    this.platform,
    this.region,
    this.licenceType,
    this.measure,
    this.featured,
    this.best,
    this.top,
    this.hot,
    this.latest,
    this.big,
    this.trending,
    this.sale,
    this.createdAt,
    this.updatedAt,
    this.isDiscount,
    this.discountDate,
    this.wholeSellQty,
    this.wholeSellDiscount,
    this.isCatalog,
    this.catalogId,
    this.comments,
    this.ratings,
  });

  int id;
  String sku;
  String productType;
  dynamic affiliateLink;
  String userId;
  String categoryId;
  String subcategoryId;
  String childcategoryId;
  dynamic attributes;
  String name;
  String slug;
  String photo;
  dynamic photoPath;
  String thumbnail;
  dynamic file;
  String size;
  String sizeQty;
  String sizePrice;
  String color;
  String price;
  String previousPrice;
  String details;
  dynamic stock;
  String policy;
  String status;
  String views;
  String tags;
  String features;
  String colors;
  String productCondition;
  dynamic ship;
  String isMeta;
  String metaTag;
  dynamic metaDescription;
  dynamic youtube;
  String type;
  String license;
  String licenseQty;
  dynamic link;
  dynamic platform;
  dynamic region;
  dynamic licenceType;
  dynamic measure;
  String featured;
  String best;
  String top;
  String hot;
  String latest;
  String big;
  String trending;
  String sale;
  DateTime createdAt;
  DateTime updatedAt;
  String isDiscount;
  dynamic discountDate;
  String wholeSellQty;
  String wholeSellDiscount;
  String isCatalog;
  String catalogId;
  List<Comment> comments;
  List<dynamic> ratings;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        productType: json["product_type"],
        affiliateLink: json["affiliate_link"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        childcategoryId: json["childcategory_id"],
        attributes: json["attributes"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        photoPath: json["photo_path"],
        thumbnail: json["thumbnail"],
        file: json["file"],
        size: json["size"],
        sizeQty: json["size_qty"],
        sizePrice: json["size_price"],
        color: json["color"],
        price: json["price"],
        previousPrice: json["previous_price"],
        details: json["details"],
        stock: json["stock"],
        policy: json["policy"],
        status: json["status"],
        views: json["views"],
        tags: json["tags"],
        features: json["features"],
        colors: json["colors"],
        productCondition: json["product_condition"],
        ship: json["ship"],
        isMeta: json["is_meta"],
        metaTag: json["meta_tag"],
        metaDescription: json["meta_description"],
        youtube: json["youtube"],
        type: json["type"],
        license: json["license"],
        licenseQty: json["license_qty"],
        link: json["link"],
        platform: json["platform"],
        region: json["region"],
        licenceType: json["licence_type"],
        measure: json["measure"],
        featured: json["featured"],
        best: json["best"],
        top: json["top"],
        hot: json["hot"],
        latest: json["latest"],
        big: json["big"],
        trending: json["trending"],
        sale: json["sale"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDiscount: json["is_discount"],
        discountDate: json["discount_date"],
        wholeSellQty: json["whole_sell_qty"],
        wholeSellDiscount: json["whole_sell_discount"],
        isCatalog: json["is_catalog"],
        catalogId: json["catalog_id"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "product_type": productType,
        "affiliate_link": affiliateLink,
        "user_id": userId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "childcategory_id": childcategoryId,
        "attributes": attributes,
        "name": name,
        "slug": slug,
        "photo": photo,
        "photo_path": photoPath,
        "thumbnail": thumbnail,
        "file": file,
        "size": size,
        "size_qty": sizeQty,
        "size_price": sizePrice,
        "color": color,
        "price": price,
        "previous_price": previousPrice,
        "details": details,
        "stock": stock,
        "policy": policy,
        "status": status,
        "views": views,
        "tags": tags,
        "features": features,
        "colors": colors,
        "product_condition": productCondition,
        "ship": ship,
        "is_meta": isMeta,
        "meta_tag": metaTag,
        "meta_description": metaDescription,
        "youtube": youtube,
        "type": type,
        "license": license,
        "license_qty": licenseQty,
        "link": link,
        "platform": platform,
        "region": region,
        "licence_type": licenceType,
        "measure": measure,
        "featured": featured,
        "best": best,
        "top": top,
        "hot": hot,
        "latest": latest,
        "big": big,
        "trending": trending,
        "sale": sale,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_discount": isDiscount,
        "discount_date": discountDate,
        "whole_sell_qty": wholeSellQty,
        "whole_sell_discount": wholeSellDiscount,
        "is_catalog": isCatalog,
        "catalog_id": catalogId,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
      };
}

class Comment {
  Comment({
    this.id,
    this.userId,
    this.productId,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.replies,
  });

  int id;
  String userId;
  String productId;
  String text;
  DateTime createdAt;
  DateTime updatedAt;
  List<Reply> replies;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        replies:
            List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "text": text,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
      };
}

class Reply {
  Reply({
    this.id,
    this.userId,
    this.commentId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String commentId;
  String text;
  DateTime createdAt;
  DateTime updatedAt;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        userId: json["user_id"],
        commentId: json["comment_id"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "comment_id": commentId,
        "text": text,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
