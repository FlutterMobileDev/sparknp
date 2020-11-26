// To parse this JSON data, do
//
//     final apiFront = apiFrontFromJson(jsonString);

import 'dart:convert';

ApiFront apiFrontFromJson(String str) => ApiFront.fromJson(json.decode(str));

String apiFrontToJson(ApiFront data) => json.encode(data.toJson());

class ApiFront {
  ApiFront({
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
  GeneralSettings generalSettings;
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

  factory ApiFront.fromJson(Map<String, dynamic> json) => ApiFront(
        status: json["status"],
        generalSettings: GeneralSettings.fromJson(json["general_settings"]),
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
        "general_settings": generalSettings.toJson(),
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
  int userId;
  String name;
  String slug;
  String features;
  String colors;
  String thumbnail;
  double price;
  double previousPrice;
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
        price: json["price"].toDouble(),
        previousPrice: json["previous_price"].toDouble(),
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
  int status;
  String photo;
  int isFeatured;
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
    this.childs,
  });

  int id;
  int categoryId;
  String name;
  String slug;
  int status;
  List<Child> childs;

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        childs: List<Child>.from(json["childs"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "status": status,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

class Child {
  Child({
    this.id,
    this.subcategoryId,
    this.name,
    this.slug,
    this.status,
  });

  int id;
  int subcategoryId;
  String name;
  String slug;
  int status;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        subcategoryId: json["subcategory_id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subcategory_id": subcategoryId,
        "name": name,
        "slug": slug,
        "status": status,
      };
}

class GeneralSettings {
  GeneralSettings({
    this.id,
    this.logo,
    this.favicon,
    this.title,
    this.headerEmail,
    this.headerPhone,
    this.footer,
    this.copyright,
    this.colors,
    this.loader,
    this.adminLoader,
    this.isTalkto,
    this.talkto,
    this.isLanguage,
    this.isLoader,
    this.mapKey,
    this.isDisqus,
    this.disqus,
    this.isContact,
    this.isFaq,
    this.guestCheckout,
    this.stripeCheck,
    this.codCheck,
    this.stripeKey,
    this.stripeSecret,
    this.currencyFormat,
    this.withdrawFee,
    this.withdrawCharge,
    this.tax,
    this.shippingCost,
    this.smtpHost,
    this.smtpPort,
    this.smtpUser,
    this.smtpPass,
    this.fromEmail,
    this.fromName,
    this.isSmtp,
    this.isComment,
    this.isCurrency,
    this.addCart,
    this.outStock,
    this.addWish,
    this.alreadyWish,
    this.wishRemove,
    this.addCompare,
    this.alreadyCompare,
    this.compareRemove,
    this.colorChange,
    this.couponFound,
    this.noCoupon,
    this.alreadyCoupon,
    this.orderTitle,
    this.orderText,
    this.isAffilate,
    this.affilateCharge,
    this.affilateBanner,
    this.alreadyCart,
    this.fixedCommission,
    this.percentageCommission,
    this.multipleShipping,
    this.multiplePackaging,
    this.vendorShipInfo,
    this.regVendor,
    this.codText,
    this.paypalText,
    this.stripeText,
    this.headerColor,
    this.footerColor,
    this.copyrightColor,
    this.isAdminLoader,
    this.menuColor,
    this.menuHoverColor,
    this.isHome,
    this.isVerificationEmail,
    this.instamojoKey,
    this.instamojoToken,
    this.instamojoText,
    this.isInstamojo,
    this.instamojoSandbox,
    this.isPaystack,
    this.paystackKey,
    this.paystackEmail,
    this.paystackText,
    this.wholesell,
    this.isCapcha,
    this.errorBanner,
    this.isPopup,
    this.popupTitle,
    this.popupText,
    this.popupBackground,
    this.invoiceLogo,
    this.userImage,
    this.vendorColor,
    this.isSecure,
    this.isReport,
    this.paypalCheck,
    this.paypalBusiness,
    this.footerLogo,
    this.emailEncryption,
    this.paytmMerchant,
    this.paytmSecret,
    this.paytmWebsite,
    this.paytmIndustry,
    this.isPaytm,
    this.paytmText,
    this.paytmMode,
    this.isMolly,
    this.mollyKey,
    this.mollyText,
    this.isRazorpay,
    this.razorpayKey,
    this.razorpaySecret,
    this.razorpayText,
    this.showStock,
    this.isMaintain,
    this.maintainText,
  });

  int id;
  String logo;
  String favicon;
  String title;
  String headerEmail;
  String headerPhone;
  String footer;
  String copyright;
  String colors;
  String loader;
  String adminLoader;
  int isTalkto;
  String talkto;
  int isLanguage;
  int isLoader;
  String mapKey;
  int isDisqus;
  String disqus;
  int isContact;
  int isFaq;
  int guestCheckout;
  int stripeCheck;
  int codCheck;
  String stripeKey;
  String stripeSecret;
  int currencyFormat;
  int withdrawFee;
  int withdrawCharge;
  int tax;
  int shippingCost;
  String smtpHost;
  String smtpPort;
  String smtpUser;
  String smtpPass;
  String fromEmail;
  String fromName;
  int isSmtp;
  int isComment;
  int isCurrency;
  String addCart;
  String outStock;
  String addWish;
  String alreadyWish;
  String wishRemove;
  String addCompare;
  String alreadyCompare;
  String compareRemove;
  String colorChange;
  String couponFound;
  String noCoupon;
  String alreadyCoupon;
  String orderTitle;
  String orderText;
  int isAffilate;
  int affilateCharge;
  String affilateBanner;
  String alreadyCart;
  int fixedCommission;
  int percentageCommission;
  int multipleShipping;
  int multiplePackaging;
  int vendorShipInfo;
  int regVendor;
  String codText;
  String paypalText;
  String stripeText;
  String headerColor;
  String footerColor;
  String copyrightColor;
  int isAdminLoader;
  String menuColor;
  String menuHoverColor;
  int isHome;
  int isVerificationEmail;
  String instamojoKey;
  String instamojoToken;
  String instamojoText;
  int isInstamojo;
  int instamojoSandbox;
  int isPaystack;
  String paystackKey;
  String paystackEmail;
  String paystackText;
  int wholesell;
  int isCapcha;
  String errorBanner;
  int isPopup;
  String popupTitle;
  String popupText;
  String popupBackground;
  String invoiceLogo;
  String userImage;
  String vendorColor;
  int isSecure;
  int isReport;
  int paypalCheck;
  String paypalBusiness;
  String footerLogo;
  String emailEncryption;
  String paytmMerchant;
  String paytmSecret;
  String paytmWebsite;
  String paytmIndustry;
  int isPaytm;
  String paytmText;
  String paytmMode;
  int isMolly;
  String mollyKey;
  String mollyText;
  int isRazorpay;
  String razorpayKey;
  String razorpaySecret;
  String razorpayText;
  int showStock;
  int isMaintain;
  String maintainText;

  factory GeneralSettings.fromJson(Map<String, dynamic> json) =>
      GeneralSettings(
        id: json["id"],
        logo: json["logo"],
        favicon: json["favicon"],
        title: json["title"],
        headerEmail: json["header_email"],
        headerPhone: json["header_phone"],
        footer: json["footer"],
        copyright: json["copyright"],
        colors: json["colors"],
        loader: json["loader"],
        adminLoader: json["admin_loader"],
        isTalkto: json["is_talkto"],
        talkto: json["talkto"],
        isLanguage: json["is_language"],
        isLoader: json["is_loader"],
        mapKey: json["map_key"],
        isDisqus: json["is_disqus"],
        disqus: json["disqus"],
        isContact: json["is_contact"],
        isFaq: json["is_faq"],
        guestCheckout: json["guest_checkout"],
        stripeCheck: json["stripe_check"],
        codCheck: json["cod_check"],
        stripeKey: json["stripe_key"],
        stripeSecret: json["stripe_secret"],
        currencyFormat: json["currency_format"],
        withdrawFee: json["withdraw_fee"],
        withdrawCharge: json["withdraw_charge"],
        tax: json["tax"],
        shippingCost: json["shipping_cost"],
        smtpHost: json["smtp_host"],
        smtpPort: json["smtp_port"],
        smtpUser: json["smtp_user"],
        smtpPass: json["smtp_pass"],
        fromEmail: json["from_email"],
        fromName: json["from_name"],
        isSmtp: json["is_smtp"],
        isComment: json["is_comment"],
        isCurrency: json["is_currency"],
        addCart: json["add_cart"],
        outStock: json["out_stock"],
        addWish: json["add_wish"],
        alreadyWish: json["already_wish"],
        wishRemove: json["wish_remove"],
        addCompare: json["add_compare"],
        alreadyCompare: json["already_compare"],
        compareRemove: json["compare_remove"],
        colorChange: json["color_change"],
        couponFound: json["coupon_found"],
        noCoupon: json["no_coupon"],
        alreadyCoupon: json["already_coupon"],
        orderTitle: json["order_title"],
        orderText: json["order_text"],
        isAffilate: json["is_affilate"],
        affilateCharge: json["affilate_charge"],
        affilateBanner: json["affilate_banner"],
        alreadyCart: json["already_cart"],
        fixedCommission: json["fixed_commission"],
        percentageCommission: json["percentage_commission"],
        multipleShipping: json["multiple_shipping"],
        multiplePackaging: json["multiple_packaging"],
        vendorShipInfo: json["vendor_ship_info"],
        regVendor: json["reg_vendor"],
        codText: json["cod_text"],
        paypalText: json["paypal_text"],
        stripeText: json["stripe_text"],
        headerColor: json["header_color"],
        footerColor: json["footer_color"],
        copyrightColor: json["copyright_color"],
        isAdminLoader: json["is_admin_loader"],
        menuColor: json["menu_color"],
        menuHoverColor: json["menu_hover_color"],
        isHome: json["is_home"],
        isVerificationEmail: json["is_verification_email"],
        instamojoKey: json["instamojo_key"],
        instamojoToken: json["instamojo_token"],
        instamojoText: json["instamojo_text"],
        isInstamojo: json["is_instamojo"],
        instamojoSandbox: json["instamojo_sandbox"],
        isPaystack: json["is_paystack"],
        paystackKey: json["paystack_key"],
        paystackEmail: json["paystack_email"],
        paystackText: json["paystack_text"],
        wholesell: json["wholesell"],
        isCapcha: json["is_capcha"],
        errorBanner: json["error_banner"],
        isPopup: json["is_popup"],
        popupTitle: json["popup_title"],
        popupText: json["popup_text"],
        popupBackground: json["popup_background"],
        invoiceLogo: json["invoice_logo"],
        userImage: json["user_image"],
        vendorColor: json["vendor_color"],
        isSecure: json["is_secure"],
        isReport: json["is_report"],
        paypalCheck: json["paypal_check"],
        paypalBusiness: json["paypal_business"],
        footerLogo: json["footer_logo"],
        emailEncryption: json["email_encryption"],
        paytmMerchant: json["paytm_merchant"],
        paytmSecret: json["paytm_secret"],
        paytmWebsite: json["paytm_website"],
        paytmIndustry: json["paytm_industry"],
        isPaytm: json["is_paytm"],
        paytmText: json["paytm_text"],
        paytmMode: json["paytm_mode"],
        isMolly: json["is_molly"],
        mollyKey: json["molly_key"],
        mollyText: json["molly_text"],
        isRazorpay: json["is_razorpay"],
        razorpayKey: json["razorpay_key"],
        razorpaySecret: json["razorpay_secret"],
        razorpayText: json["razorpay_text"],
        showStock: json["show_stock"],
        isMaintain: json["is_maintain"],
        maintainText: json["maintain_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "favicon": favicon,
        "title": title,
        "header_email": headerEmail,
        "header_phone": headerPhone,
        "footer": footer,
        "copyright": copyright,
        "colors": colors,
        "loader": loader,
        "admin_loader": adminLoader,
        "is_talkto": isTalkto,
        "talkto": talkto,
        "is_language": isLanguage,
        "is_loader": isLoader,
        "map_key": mapKey,
        "is_disqus": isDisqus,
        "disqus": disqus,
        "is_contact": isContact,
        "is_faq": isFaq,
        "guest_checkout": guestCheckout,
        "stripe_check": stripeCheck,
        "cod_check": codCheck,
        "stripe_key": stripeKey,
        "stripe_secret": stripeSecret,
        "currency_format": currencyFormat,
        "withdraw_fee": withdrawFee,
        "withdraw_charge": withdrawCharge,
        "tax": tax,
        "shipping_cost": shippingCost,
        "smtp_host": smtpHost,
        "smtp_port": smtpPort,
        "smtp_user": smtpUser,
        "smtp_pass": smtpPass,
        "from_email": fromEmail,
        "from_name": fromName,
        "is_smtp": isSmtp,
        "is_comment": isComment,
        "is_currency": isCurrency,
        "add_cart": addCart,
        "out_stock": outStock,
        "add_wish": addWish,
        "already_wish": alreadyWish,
        "wish_remove": wishRemove,
        "add_compare": addCompare,
        "already_compare": alreadyCompare,
        "compare_remove": compareRemove,
        "color_change": colorChange,
        "coupon_found": couponFound,
        "no_coupon": noCoupon,
        "already_coupon": alreadyCoupon,
        "order_title": orderTitle,
        "order_text": orderText,
        "is_affilate": isAffilate,
        "affilate_charge": affilateCharge,
        "affilate_banner": affilateBanner,
        "already_cart": alreadyCart,
        "fixed_commission": fixedCommission,
        "percentage_commission": percentageCommission,
        "multiple_shipping": multipleShipping,
        "multiple_packaging": multiplePackaging,
        "vendor_ship_info": vendorShipInfo,
        "reg_vendor": regVendor,
        "cod_text": codText,
        "paypal_text": paypalText,
        "stripe_text": stripeText,
        "header_color": headerColor,
        "footer_color": footerColor,
        "copyright_color": copyrightColor,
        "is_admin_loader": isAdminLoader,
        "menu_color": menuColor,
        "menu_hover_color": menuHoverColor,
        "is_home": isHome,
        "is_verification_email": isVerificationEmail,
        "instamojo_key": instamojoKey,
        "instamojo_token": instamojoToken,
        "instamojo_text": instamojoText,
        "is_instamojo": isInstamojo,
        "instamojo_sandbox": instamojoSandbox,
        "is_paystack": isPaystack,
        "paystack_key": paystackKey,
        "paystack_email": paystackEmail,
        "paystack_text": paystackText,
        "wholesell": wholesell,
        "is_capcha": isCapcha,
        "error_banner": errorBanner,
        "is_popup": isPopup,
        "popup_title": popupTitle,
        "popup_text": popupText,
        "popup_background": popupBackground,
        "invoice_logo": invoiceLogo,
        "user_image": userImage,
        "vendor_color": vendorColor,
        "is_secure": isSecure,
        "is_report": isReport,
        "paypal_check": paypalCheck,
        "paypal_business": paypalBusiness,
        "footer_logo": footerLogo,
        "email_encryption": emailEncryption,
        "paytm_merchant": paytmMerchant,
        "paytm_secret": paytmSecret,
        "paytm_website": paytmWebsite,
        "paytm_industry": paytmIndustry,
        "is_paytm": isPaytm,
        "paytm_text": paytmText,
        "paytm_mode": paytmMode,
        "is_molly": isMolly,
        "molly_key": mollyKey,
        "molly_text": mollyText,
        "is_razorpay": isRazorpay,
        "razorpay_key": razorpayKey,
        "razorpay_secret": razorpaySecret,
        "razorpay_text": razorpayText,
        "show_stock": showStock,
        "is_maintain": isMaintain,
        "maintain_text": maintainText,
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
  int userId;
  String name;
  String slug;
  dynamic features;
  dynamic colors;
  String thumbnail;
  double price;
  double previousPrice;
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
        price: json["price"].toDouble(),
        previousPrice: json["previous_price"].toDouble(),
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

  int id;
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

  int id;
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
  int slider;
  int service;
  int featured;
  int smallBanner;
  int best;
  int topRated;
  int largeBanner;
  int big;
  int hotSale;
  int partners;
  int reviewBlog;
  String bestSellerBanner;
  String bestSellerBannerLink;
  String bigSaveBanner;
  String bigSaveBannerLink;
  int bottomSmall;
  int flashDeal;
  String bestSellerBanner1;
  String bestSellerBannerLink1;
  String bigSaveBanner1;
  String bigSaveBannerLink1;
  int featuredCategory;

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

  int id;
  String photo;
  String title;
  String subtitle;
  String details;
  int userId;

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

  int id;
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
