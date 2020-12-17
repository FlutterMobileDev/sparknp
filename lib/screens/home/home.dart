import 'package:flutter/material.dart';

import 'package:sparknp/screens/home/homecomponent/homebody.dart';
import 'package:sparknp/screens/categories/categoriescomponents/categorybody.dart';

import 'package:sparknp/router.dart';

import 'package:sparknp/constants.dart';

TabController _tabController;

class HomeScreen extends StatefulWidget {
  final front;
  final String token;
  final double currency;
  const HomeScreen({Key key, this.front, this.token, this.currency})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: widget.front["categories"].length + 1);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.network("https://sparknp.com/assets/images/" +
            widget.front["general_settings"]["logo"]),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: "All",
            ),
            for (int i = 0; i < widget.front["categories"].length; i++)
              Tab(text: widget.front["categories"][i]["name"]),
          ],
        ),
        backgroundColor: LightColor.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: LightColor.textLightColor),
        title: Center(
          child: Container(
            width: AppTheme.fullWidth(context) * 0.8,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FlatButton(
              textColor: LightColor.iconColor,
              child: Padding(
                padding: EdgeInsets.only(
                    right: ((AppTheme.fullWidth(context) * 0.4))),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text("Search"),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  search,
                );
              },
            ),
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        HomeBody(
          front: widget.front,
          currency: widget.currency,
        ),
        for (int i = 0; i < widget.front["categories"].length; i++)
          CategoryBody(
            category: widget.front["categories"][i],
            isMulti: true,
          )
      ]),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
