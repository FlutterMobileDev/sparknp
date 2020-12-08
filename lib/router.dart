import 'package:flutter/material.dart';

import 'package:sparknp/model/screenarguments.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

import 'package:sparknp/splash.dart';

import 'package:sparknp/screens/login/login.dart';
import 'package:sparknp/screens/home/home.dart';
import 'package:sparknp/screens/home/homecomponent/more.dart';
import 'package:sparknp/screens/home/homecomponent/search.dart';

import 'package:sparknp/screens/orders/myorders.dart';

import 'package:sparknp/screens/account/myaccount.dart';

import 'package:sparknp/screens/details/details.dart';

import 'package:sparknp/screens/cart/cart.dart';
import 'package:sparknp/screens/cart/cartcomponents/processcart.dart';
import 'package:sparknp/screens/wishlist/wishlist.dart';

const String splash = '/';
const String home = '/home';
const String search = '/search';
const String login = '/login';
const String register = '/register';
const String myOrders = '/myorders';
const String myAccount = '/account';
const String accInfo = '/accinfo';
const String categories = '/categories';
const String details = '/details';
const String cart = '/cart';
const String processCart = '/processCart';
const String wishlist = '/wishlist';
const String more = '/more';
const String bottomnav = "/nav";

class Routing {
  static Route<dynamic> generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case categories:
        ScreenArguments args = screen.arguments;
        return MaterialPageRoute(
            builder: (_) =>
                CategoryBody(category: args.category, isMulti: args.isMulti));
      case search:
        return MaterialPageRoute(builder: (_) => Search());
      case more:
        ScreenArguments args = screen.arguments;
        return MaterialPageRoute(
          builder: (_) =>
              MoreScreen(name: args.name, front: args.front, subId: args.id),
        );
      case bottomnav:
        ScreenArguments args = screen.arguments;
        return MaterialPageRoute(
          builder: (_) =>
              Bottomnavbar( front: args.front, token: args.token,index: args.index,),
        );

      case myOrders:
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case myAccount:
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case wishlist:
        return MaterialPageRoute(builder: (_) => WishlistScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case processCart:
        return MaterialPageRoute(builder: (_) => ProcessScreen());
      case details:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(screen.arguments),
        );
      default:
        return MaterialPageRoute(builder: (_) => Bottomnavbar());
    }
  }
}
