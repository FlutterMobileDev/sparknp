import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/widgets/drawer/catdrawer.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int myIndex;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  //The Logic where you change the pages
  _onChangePage(int index) {
    if (index != 0)
      setState(() => myIndex =
          index); //change myIndex if you're Selecting between Settings and Explore
    _controller.animateToPage(index.clamp(0, 1),
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: PageView.builder(
      controller: _controller,
      physics:
          NeverScrollableScrollPhysics(), //so the user can not move between pages
      itemCount: 2,
      itemBuilder: (context, index) {
        // Original Drawer
        if (index == 0)
          return MyWidget(
            explore: () => _onChangePage(1),
            settings: () => _onChangePage(2),
          );
        //Second Drawer form the PageView
        switch (myIndex) {
          case 1:
            return MyExploreAll(goBack: () => _onChangePage(0));
          case 2:
          default:
            return MySettings(goBack: () => _onChangePage(0));
        }
      },
    ));
  }
}

//The Menu Drawer (Your first image)
class MyWidget extends StatelessWidget {
  final VoidCallback explore;
  final VoidCallback settings;

  MyWidget({this.explore, this.settings});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: LightColor.mainColor,
            pinned: true,
            title: Text(
              'Spark Np',
              style: TextStyle(color: LightColor.black),
            ),
            leading: Icon(
              Icons.store_mall_directory_rounded,
              color: LightColor.black,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, home, (home) => false);
                }),
            ListTile(
                title: Text('Your Orders'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, myOrders, (home) => true);
                }),
            ListTile(
                title: Text('Your Account'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, myAccount, (home) => true);
                }),
            ListTile(
              title: Text('Shop by Categories'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: explore,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
                title: Text('Customer Service'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, custService, (home) => true);
                }),
            ListTile(
                title: Text('Sign In'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, login, (home) => true);
                }),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: Text('Settings'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: LightColor.iconColor,
              ),
              onTap: settings,
            ),
          ]))
        ],
      ),
    );
  }
}

// The settings Drawer(second image)
class MySettings extends StatelessWidget {
  final VoidCallback goBack;

  MySettings({this.goBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Main Menu',
              style: TextStyle(color: LightColor.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: LightColor.black,
              ),
              onPressed: goBack,
            ),
            backgroundColor: Colors.blueAccent[900],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
              title: Text(
                'Settings',
              ),
              onTap: () => print('Settings'),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: Text('Change Country'),
              onTap: () => print('Change Country'),
            ),
            ListTile(
              title: Text('ETC'),
              onTap: () => print('ETC'),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: Text('Dummy Text'),
              onTap: () => print('Dummy Text'),
            ),
          ]))
        ],
      ),
    );
  }
}

class MyInnerDrawer extends StatelessWidget {
  final String name;
  final PageController _controller;

  MyInnerDrawer(this._controller, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(name),
        trailing: const Icon(Icons.arrow_back_ios),
        onTap: () => _controller.animateToPage(0,
            duration: const Duration(milliseconds: 250), curve: Curves.linear),
      )
    ]);
  }
}
