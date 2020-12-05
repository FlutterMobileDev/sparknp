import 'package:flutter/material.dart';

import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/model/searchmodel.dart';

import 'package:sparknp/widgets/appbar.dart';
import 'package:sparknp/screens/home/homecomponent/homebody.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';

TabController _tabController;

class HomeScreen extends StatefulWidget {
  final ApiFront front;
  final String token;
  const HomeScreen({Key key, this.front, this.token}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _loading;
  SearchProducts products;

  @override
  void initState() {
    super.initState();
    _loading = true;

    _tabController =
        TabController(vsync: this, length: widget.front.categories.length + 1);
    _loading = false;
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
                  for (int i = 0; i < widget.front.categories.length; i++)
                    Tab(text: widget.front.categories[i].name),
                ],
              ),
              backgroundColor: LightColor.primaryColor,
              elevation: 0,
              iconTheme: IconThemeData(color: LightColor.textLightColor),
              title: Center(
                child: Container(
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
              ),
              actions: (widget.token != null)
                  ? null
                  : [
                      FlatButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, login);
                          }),
                    ],
            ),
            // drawer: MainDrawer(front: widget.front),
            body: TabBarView(controller: _tabController, children: [
              HomeBody(
                front: widget.front,
              ),
              for (int i = 0; i < widget.front.categories.length; i++)
                CategoryBody(category: widget.front.categories[i])
            ]),
          );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Future<void> _showDialog(context, txt) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(txt),
      );
    },
  );
}
