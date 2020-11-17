// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.generalSettings,
    this.categories,
    this.sliders,
    this.topSmallBanners,
    this.pageSettings,
    this.featureProducts,
    this.services,
    this.largeBanners,
    this.reviews,
    this.discountProducts,
    this.bestProducts,
    this.topProducts,
    this.bigProducts,
    this.hotProducts,
    this.latestProducts,
    this.trendingProducts,
    this.saleProducts,
  });

  bool status;
  Map<String, String> generalSettings;
  List<Category> categories;
  List<Slider> sliders;
  List<Banner> topSmallBanners;
  PageSettings pageSettings;
  List<BestProductElement> featureProducts;
  List<Review> services;
  List<Banner> largeBanners;
  List<Review> reviews;
  List<dynamic> discountProducts;
  List<BestProductElement> bestProducts;
  List<HotProductElement> topProducts;
  List<BestProductElement> bigProducts;
  List<HotProductElement> hotProducts;
  List<HotProductElement> latestProducts;
  List<HotProductElement> trendingProducts;
  List<HotProductElement> saleProducts;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        generalSettings: Map.from(json["general_settings"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        sliders:
            List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
        topSmallBanners: List<Banner>.from(
            json["top_small_banners"].map((x) => Banner.fromJson(x))),
        pageSettings: PageSettings.fromJson(json["page_settings"]),
        featureProducts: List<BestProductElement>.from(json["feature_products"]
            .map((x) => BestProductElement.fromJson(x))),
        services:
            List<Review>.from(json["services"].map((x) => Review.fromJson(x))),
        largeBanners: List<Banner>.from(
            json["large_banners"].map((x) => Banner.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        discountProducts:
            List<dynamic>.from(json["discount_products"].map((x) => x)),
        bestProducts: List<BestProductElement>.from(
            json["best_products"].map((x) => BestProductElement.fromJson(x))),
        topProducts: List<HotProductElement>.from(
            json["top_products"].map((x) => HotProductElement.fromJson(x))),
        bigProducts: List<BestProductElement>.from(
            json["big_products"].map((x) => BestProductElement.fromJson(x))),
        hotProducts: List<HotProductElement>.from(
            json["hot_products"].map((x) => HotProductElement.fromJson(x))),
        latestProducts: List<HotProductElement>.from(
            json["latest_products"].map((x) => HotProductElement.fromJson(x))),
        trendingProducts: List<HotProductElement>.from(json["trending_products"]
            .map((x) => HotProductElement.fromJson(x))),
        saleProducts: List<HotProductElement>.from(
            json["sale_products"].map((x) => HotProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "general_settings": Map.from(generalSettings)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
        "top_small_banners":
            List<dynamic>.from(topSmallBanners.map((x) => x.toJson())),
        "page_settings": pageSettings.toJson(),
        "feature_products":
            List<dynamic>.from(featureProducts.map((x) => x.toJson())),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "large_banners":
            List<dynamic>.from(largeBanners.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "discount_products": List<dynamic>.from(discountProducts.map((x) => x)),
        "best_products":
            List<dynamic>.from(bestProducts.map((x) => x.toJson())),
        "top_products": List<dynamic>.from(topProducts.map((x) => x.toJson())),
        "big_products": List<dynamic>.from(bigProducts.map((x) => x.toJson())),
        "hot_products": List<dynamic>.from(hotProducts.map((x) => x.toJson())),
        "latest_products":
            List<dynamic>.from(latestProducts.map((x) => x.toJson())),
        "trending_products":
            List<dynamic>.from(trendingProducts.map((x) => x.toJson())),
        "sale_products":
            List<dynamic>.from(saleProducts.map((x) => x.toJson())),
      };
}

class BestProductElement {
  BestProductElement({
    this.id,
    this.userId,
    this.name,
    this.slug,
    this.features,
    this.colors,
    this.thumbnail,
    this.price,
    this.previousPrice,
    this.attributes,
    this.size,
    this.sizePrice,
    this.discountDate,
  });

  int id;
  String userId;
  String name;
  String slug;
  String features;
  String colors;
  String thumbnail;
  String price;
  String previousPrice;
  dynamic attributes;
  String size;
  String sizePrice;
  dynamic discountDate;

  factory BestProductElement.fromJson(Map<String, dynamic> json) =>
      BestProductElement(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        features: json["features"],
        colors: json["colors"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        previousPrice: json["previous_price"],
        attributes: json["attributes"],
        size: json["size"],
        sizePrice: json["size_price"],
        discountDate: json["discount_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "features": features,
        "colors": colors,
        "thumbnail": thumbnail,
        "price": price,
        "previous_price": previousPrice,
        "attributes": attributes,
        "size": size,
        "size_price": sizePrice,
        "discount_date": discountDate,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.photo,
    this.isFeatured,
    this.image,
    this.subs,
  });

  int id;
  String name;
  String slug;
  String status;
  String photo;
  String isFeatured;
  String image;
  List<Sub> subs;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        photo: json["photo"],
        isFeatured: json["is_featured"],
        image: json["image"] == null ? null : json["image"],
        subs: List<Sub>.from(json["subs"].map((x) => Sub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "photo": photo,
        "is_featured": isFeatured,
        "image": image == null ? null : image,
        "subs": List<dynamic>.from(subs.map((x) => x.toJson())),
      };
}

class Sub {
  Sub({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.status,
  });

  int id;
  String categoryId;
  String name;
  String slug;
  String status;

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "status": status,
      };
}

class HotProductElement {
  HotProductElement({
    this.id,
    this.userId,
    this.name,
    this.slug,
    this.features,
    this.colors,
    this.thumbnail,
    this.price,
    this.previousPrice,
    this.attributes,
    this.size,
    this.sizePrice,
    this.discountDate,
  });

  int id;
  String userId;
  String name;
  String slug;
  dynamic features;
  dynamic colors;
  String thumbnail;
  String price;
  String previousPrice;
  dynamic attributes;
  String size;
  String sizePrice;
  dynamic discountDate;

  factory HotProductElement.fromJson(Map<String, dynamic> json) =>
      HotProductElement(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        features: json["features"],
        colors: json["colors"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        previousPrice: json["previous_price"],
        attributes: json["attributes"],
        size: json["size"],
        sizePrice: json["size_price"],
        discountDate: json["discount_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "features": features,
        "colors": colors,
        "thumbnail": thumbnail,
        "price": price,
        "previous_price": previousPrice,
        "attributes": attributes,
        "size": size,
        "size_price": sizePrice,
        "discount_date": discountDate,
      };
}

enum Color { THE_000000, FF0000, THE_85817_B, THE_2_C89_DB }

final colorValues = EnumValues({
  "#ff0000": Color.FF0000,
  "#000000": Color.THE_000000,
  "#2c89db": Color.THE_2_C89_DB,
  "#85817b": Color.THE_85817_B
});

enum Feature { BLACK, RED_GLASS, POLARIZE, BLUE_FULL }

final featureValues = EnumValues({
  "Black": Feature.BLACK,
  "Blue full": Feature.BLUE_FULL,
  "polarize": Feature.POLARIZE,
  "Red glass": Feature.RED_GLASS
});

class Banner {
  Banner({
    this.id,
    this.photo,
    this.link,
    this.type,
  });

  String id;
  String photo;
  String link;
  String type;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        photo: json["photo"],
        link: json["link"] == null ? null : json["link"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "link": link == null ? null : link,
        "type": type,
      };
}

class PageSettings {
  PageSettings({
    this.id,
    this.contactSuccess,
    this.contactEmail,
    this.contactTitle,
    this.contactText,
    this.sideTitle,
    this.sideText,
    this.street,
    this.phone,
    this.fax,
    this.email,
    this.site,
    this.slider,
    this.service,
    this.featured,
    this.smallBanner,
    this.best,
    this.topRated,
    this.largeBanner,
    this.big,
    this.hotSale,
    this.partners,
    this.reviewBlog,
    this.bestSellerBanner,
    this.bestSellerBannerLink,
    this.bigSaveBanner,
    this.bigSaveBannerLink,
    this.bottomSmall,
    this.flashDeal,
    this.bestSellerBanner1,
    this.bestSellerBannerLink1,
    this.bigSaveBanner1,
    this.bigSaveBannerLink1,
    this.featuredCategory,
  });

  String id;
  String contactSuccess;
  String contactEmail;
  String contactTitle;
  String contactText;
  String sideTitle;
  String sideText;
  String street;
  String phone;
  dynamic fax;
  String email;
  String site;
  String slider;
  String service;
  String featured;
  String smallBanner;
  String best;
  String topRated;
  String largeBanner;
  String big;
  String hotSale;
  String partners;
  String reviewBlog;
  String bestSellerBanner;
  String bestSellerBannerLink;
  String bigSaveBanner;
  String bigSaveBannerLink;
  String bottomSmall;
  String flashDeal;
  String bestSellerBanner1;
  String bestSellerBannerLink1;
  String bigSaveBanner1;
  String bigSaveBannerLink1;
  String featuredCategory;

  factory PageSettings.fromJson(Map<String, dynamic> json) => PageSettings(
        id: json["id"],
        contactSuccess: json["contact_success"],
        contactEmail: json["contact_email"],
        contactTitle: json["contact_title"],
        contactText: json["contact_text"],
        sideTitle: json["side_title"],
        sideText: json["side_text"],
        street: json["street"],
        phone: json["phone"],
        fax: json["fax"],
        email: json["email"],
        site: json["site"],
        slider: json["slider"],
        service: json["service"],
        featured: json["featured"],
        smallBanner: json["small_banner"],
        best: json["best"],
        topRated: json["top_rated"],
        largeBanner: json["large_banner"],
        big: json["big"],
        hotSale: json["hot_sale"],
        partners: json["partners"],
        reviewBlog: json["review_blog"],
        bestSellerBanner: json["best_seller_banner"],
        bestSellerBannerLink: json["best_seller_banner_link"],
        bigSaveBanner: json["big_save_banner"],
        bigSaveBannerLink: json["big_save_banner_link"],
        bottomSmall: json["bottom_small"],
        flashDeal: json["flash_deal"],
        bestSellerBanner1: json["best_seller_banner1"],
        bestSellerBannerLink1: json["best_seller_banner_link1"],
        bigSaveBanner1: json["big_save_banner1"],
        bigSaveBannerLink1: json["big_save_banner_link1"],
        featuredCategory: json["featured_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contact_success": contactSuccess,
        "contact_email": contactEmail,
        "contact_title": contactTitle,
        "contact_text": contactText,
        "side_title": sideTitle,
        "side_text": sideText,
        "street": street,
        "phone": phone,
        "fax": fax,
        "email": email,
        "site": site,
        "slider": slider,
        "service": service,
        "featured": featured,
        "small_banner": smallBanner,
        "best": best,
        "top_rated": topRated,
        "large_banner": largeBanner,
        "big": big,
        "hot_sale": hotSale,
        "partners": partners,
        "review_blog": reviewBlog,
        "best_seller_banner": bestSellerBanner,
        "best_seller_banner_link": bestSellerBannerLink,
        "big_save_banner": bigSaveBanner,
        "big_save_banner_link": bigSaveBannerLink,
        "bottom_small": bottomSmall,
        "flash_deal": flashDeal,
        "best_seller_banner1": bestSellerBanner1,
        "best_seller_banner_link1": bestSellerBannerLink1,
        "big_save_banner1": bigSaveBanner1,
        "big_save_banner_link1": bigSaveBannerLink1,
        "featured_category": featuredCategory,
      };
}

class Review {
  Review({
    this.id,
    this.photo,
    this.title,
    this.subtitle,
    this.details,
    this.userId,
  });

  String id;
  String photo;
  String title;
  String subtitle;
  String details;
  String userId;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        photo: json["photo"],
        title: json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        details: json["details"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "title": title,
        "subtitle": subtitle == null ? null : subtitle,
        "details": details,
        "user_id": userId == null ? null : userId,
      };
}

class Slider {
  Slider({
    this.id,
    this.subtitleText,
    this.subtitleSize,
    this.subtitleColor,
    this.subtitleAnime,
    this.titleText,
    this.titleSize,
    this.titleColor,
    this.titleAnime,
    this.detailsText,
    this.detailsSize,
    this.detailsColor,
    this.detailsAnime,
    this.photo,
    this.position,
    this.link,
  });

  String id;
  String subtitleText;
  String subtitleSize;
  String subtitleColor;
  String subtitleAnime;
  String titleText;
  String titleSize;
  String titleColor;
  String titleAnime;
  String detailsText;
  String detailsSize;
  String detailsColor;
  String detailsAnime;
  String photo;
  String position;
  String link;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        subtitleText: json["subtitle_text"],
        subtitleSize: json["subtitle_size"],
        subtitleColor: json["subtitle_color"],
        subtitleAnime: json["subtitle_anime"],
        titleText: json["title_text"],
        titleSize: json["title_size"],
        titleColor: json["title_color"],
        titleAnime: json["title_anime"],
        detailsText: json["details_text"],
        detailsSize: json["details_size"],
        detailsColor: json["details_color"],
        detailsAnime: json["details_anime"],
        photo: json["photo"],
        position: json["position"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subtitle_text": subtitleText,
        "subtitle_size": subtitleSize,
        "subtitle_color": subtitleColor,
        "subtitle_anime": subtitleAnime,
        "title_text": titleText,
        "title_size": titleSize,
        "title_color": titleColor,
        "title_anime": titleAnime,
        "details_text": detailsText,
        "details_size": detailsSize,
        "details_color": detailsColor,
        "details_anime": detailsAnime,
        "photo": photo,
        "position": position,
        "link": link,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
