import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/widgets/drawer/catdrawer.dart';

import 'package:sparknp/services/storage.dart';

class MainDrawer extends StatefulWidget {
  final ApiFront front;
  const MainDrawer({Key key, this.front}) : super(key: key);
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int myIndex;
  PageController _controller;

  final SecureStorage secureStorage = SecureStorage();
  String _token;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });
  }

  //The Logic where you change the pages
  _onChangePage(int index) {
    if (index != 0) setState(() => myIndex = index);
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          // Original Drawer
          if (index == 0)
            return MyWidget(
              explore: () => _onChangePage(1),
              token: _token,
            );
          //Second Drawer form the PageView
          return MyExploreAll(
            goBack: () => _onChangePage(0),
            front: widget.front,
          );
        },
      ),
    );
  }
}

//The Menu Drawer (Your first image)
class MyWidget extends StatelessWidget {
  final VoidCallback explore;

  final String token;

  MyWidget({this.explore, this.token});

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
                  Navigator.pushNamed(context, home);
                }),
            ListTile(
                title: Text('Your Account'),
                onTap: () {
                  if (token != null) {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, myAccount);
                  } else {
                    _showDialog(context, 'Please Log In');
                  }
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
                title: Text('Sign In'),
                onTap: () {
                  if (token == null) {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, login);
                  } else {
                    _showDialog(context, 'Already logged In');
                  }
                }),
            const Divider(
              color: Colors.grey,
              thickness: 1,
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
