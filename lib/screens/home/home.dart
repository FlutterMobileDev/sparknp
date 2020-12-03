import 'package:flutter/material.dart';

import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/model/searchmodel.dart';
import 'package:sparknp/services/frontservice.dart';

import 'package:sparknp/widgets/drawer/drawer.dart';
import 'package:sparknp/screens/home/homecomponent/homebody.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/widgets/appbar/barbutton.dart';

import 'package:sparknp/services/storage.dart';

TabController _tabController;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final SecureStorage secureStorage = SecureStorage();

  bool _loading;
  ApiFront front;
  String _token;
  SearchProducts products;

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
          _tabController =
              TabController(vsync: this, length: front.categories.length + 1);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  for (int i = 0; i < front.categories.length; i++)
                    Tab(text: front.categories[i].name),
                ],
              ),
              backgroundColor: LightColor.primaryColor,
              elevation: 0,
              iconTheme: IconThemeData(color: LightColor.textLightColor),
              actions: <Widget>[
                Row(children: [
                  Container(
                    width: size.width * 0.6,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          )),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          search,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconBtnWithCounter(
                      svgSrc: "assets/Cart Icon.svg",
                      // numOfitem: cart.carts,
                      press: () {
                        if (_token != null) {
                          Navigator.pushNamed(
                            context,
                            cart,
                          );
                        } else {
                          _showDialog(context);
                        }
                      }),
                  IconBtnWithCounter(
                      svgSrc: "assets/Heart Icon.svg",
                      // numOfitem: 5,
                      press: () {
                        if (_token != null) {
                          Navigator.pushNamed(
                            context,
                            wishlist,
                          );
                        } else {
                          _showDialog(context);
                        }
                      }),
                  SizedBox(width: defaultPadding / 2)
                ])
              ],
            ),
            drawer: MainDrawer(front: front),
            body: TabBarView(controller: _tabController, children: [
              HomeBody(
                front: front,
              ),
              for (int i = 0; i < front.categories.length; i++)
                CategoryBody(category: front.categories[i])
            ]),
          );
  }

  Future<void> _showDialog(context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please Log In'),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
