import 'package:flutter/material.dart';

import 'package:sparknp/screens/login/login.dart';

import 'package:sparknp/screens/home/home.dart';
import 'package:sparknp/screens/myorders.dart';
import 'package:sparknp/screens/myaccount.dart';
import 'package:sparknp/screens/accinfo.dart';
import 'package:sparknp/screens/custservice.dart';
import 'package:sparknp/screens/categories/categories.dart';

import 'package:sparknp/screens/details/details.dart';
// import 'package:sparknp/model/product.dart';

import 'package:sparknp/screens/cart/cart.dart';

const String home = '/';
const String login = '/login';
const String register = '/register';
const String myOrders = '/myorders';
const String myAccount = '/account';
const String accInfo = '/accinfo';
const String custService = '/custservice';
const String categories = '/categories';
const String details = '/details';
const String cart = '/cart';

//TODO: when logged in route pages

class Routing {
  static Route<dynamic> generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
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
      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case details:
        return MaterialPageRoute(builder: (_) => DetailsScreen()
            //DetailsScreen(product: products[0]),
            );
      case categories:
        return MaterialPageRoute(
          builder: (_) => Categories(category: screen.arguments),
        );
      default:
        return null;
    }
  }
}
