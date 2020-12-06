import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';
import 'package:sparknp/screens/categories/categories.dart';

import 'package:sparknp/services/frontservice.dart';

import 'package:sparknp/model/frontjson.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sparknp/screens/account/myaccount.dart';
import 'package:sparknp/screens/cart/cart.dart';
import 'package:sparknp/screens/home/home.dart';
import 'package:sparknp/screens/wishlist/wishlist.dart';

import 'package:sparknp/services/storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SecureStorage secureStorage = SecureStorage();

  bool _loading;
  ApiFront front;
  String _token;

  @override
  void initState() {
    super.initState();
    _loading = true;

    FrontService.fetch().then((data) {
      secureStorage.readData('token').then((value) {
        setState(() {
          front = data;
          _token = value;
          _loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            color: LightColor.textColor,
            child: Center(child: CircularProgressIndicator()))
        : Bottomnavbar(front: front, token: _token);
  }
}

class Bottomnavbar extends StatefulWidget {
  final ApiFront front;
  final String token;
  Bottomnavbar({Key key, this.front, this.token}) : super(key: key);
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(front: widget.front, token: widget.token),
            Categories(category: widget.front.categories),
            CartScreen(),
            WishlistScreen(),
            ProfilePage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            activeColor: LightColor.primaryColor,
            inactiveColor: LightColor.darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.list_alt_rounded),
            title: Text("Categories"),
            activeColor: LightColor.primaryColor,
            inactiveColor: LightColor.darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            title: Text("Cart"),
            activeColor: LightColor.primaryColor,
            inactiveColor: LightColor.darkgrey,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/Heart Icon.svg"),
            title: Text("Wishlist"),
            activeColor: LightColor.primaryColor,
            inactiveColor: LightColor.darkgrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("My Account"),
            activeColor: LightColor.primaryColor,
            inactiveColor: LightColor.darkgrey,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
