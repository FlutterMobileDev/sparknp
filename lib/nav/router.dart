import 'package:flutter/material.dart';

import 'package:sparknp/nav/login.dart';
import 'package:sparknp/nav/registration.dart';

import 'package:sparknp/home.dart';
import 'package:sparknp/nav/myorders.dart';
import 'package:sparknp/nav/myaccount.dart';
import 'package:sparknp/nav/accinfo.dart';
import 'package:sparknp/nav/custservice.dart';
import 'package:sparknp/nav/categories.dart';
// import 'package:sparknp/nav/shopping_cart.dart';

const String home = '/';
const String login = '/login';
const String register = '/register';
const String myOrders = '/myorders';
const String myAccount = '/account';
const String accInfo = '/accinfo';
const String custService = '/custservice';
const String categories = '/categories';
// const String cart = '/cart';

//TODO: when logged in route pages

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case myOrders:
        return MaterialPageRoute(builder: (_) => MyOrders());
      case myAccount:
        return MaterialPageRoute(builder: (_) => MyAccount());
      case accInfo:
        return MaterialPageRoute(builder: (_) => AccInfo());
      case custService:
        return MaterialPageRoute(builder: (_) => CustService());
      // case cart:
      //   return MaterialPageRoute(builder: (_) => ShoppingCartPage());
      case categories:
        return MaterialPageRoute(
          builder: (_) => Categories(settings.arguments),
        );
    }
  }
}
