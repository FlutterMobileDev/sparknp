import 'package:flutter/material.dart';

import 'home.dart';
import 'myorders.dart';
import 'myaccount.dart';
import 'accinfo.dart';
import 'custservice.dart';
import 'categories.dart';

const String home = '/';
const String myOrders = '/myorders';
const String myAccount = '/account';
const String accInfo = '/accinfo';
const String custService = '/custservice';
const String categories = '/categories';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case myOrders:
        return MaterialPageRoute(builder: (_) => MyOrders());
      case myAccount:
        return MaterialPageRoute(builder: (_) => MyAccount());
      case accInfo:
        return MaterialPageRoute(builder: (_) => AccInfo());
      case custService:
        return MaterialPageRoute(builder: (_) => CustService());
      case categories:
        return MaterialPageRoute(
          builder: (_) => Categories(settings.arguments),
        );
    }
  }
}
