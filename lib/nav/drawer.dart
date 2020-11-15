import 'package:flutter/material.dart';

import 'package:sparknp/nav/router.dart';

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
            pinned: true,
            title: Text(
              'Spark Np',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.store_mall_directory_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.blueAccent[900],
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
              trailing: const Icon(Icons.arrow_forward_ios),
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
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
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

class MyExploreAll extends StatelessWidget {
  final VoidCallback goBack;

  MyExploreAll({this.goBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Main Menu',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: goBack,
            ),
            backgroundColor: Colors.blueAccent[900],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
              title: Text(
                'Shop By Categories',
                textScaleFactor: 2,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.masks_rounded),
              title: Text(
                "Men's Fashion",
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: "Men's Fashion");
              },
            ),
            ListTile(
              leading: const Icon(Icons.wallet_travel_rounded),
              title: Text(
                "Women's Fashion",
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: "Women's Fashion");
              },
            ),
            ListTile(
              leading: const Icon(Icons.laptop),
              title: Text(
                'Electronic Devices',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Electronic Devices');
              },
            ),
            ListTile(
              leading: const Icon(Icons.mouse_rounded),
              title: Text(
                'Electronic Accessories',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Electronic Accessories');
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: Text(
                'Camera & Photo',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Camera & Photo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_football_rounded),
              title: Text(
                'Sport & Outdoor',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Sport & Outdoor');
              },
            ),
            ListTile(
              leading: const Icon(Icons.brush_rounded),
              title: Text(
                'Health & Beauty',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Health & Beauty');
              },
            ),
            ListTile(
              leading: const Icon(Icons.watch),
              title: Text(
                'Watches & Accessories',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Watches & Accessories');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded),
              title: Text(
                'Books & Office',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Books & Office');
              },
            ),
            ListTile(
              leading: const Icon(Icons.baby_changing_station_rounded),
              title: Text(
                'Baby & Toys',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Baby & Toys');
              },
            ),
            ListTile(
              leading: const Icon(Icons.motorcycle_rounded),
              title: Text(
                'Automobile & Motorcycles',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Automobile & Motorcycles');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text(
                'Home, Lifestyle, decoration & Appliances',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Home, Lifestyle, decoration & Appliances');
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_grocery_store_rounded),
              title: Text(
                'Groceries & Pets',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Groceries & Pets');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'Portable & Personal',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Portable & Personal');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online_rounded),
              title: Text(
                'Electronics Outdoor',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Electronics Outdoor');
              },
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center_rounded),
              title: Text(
                'Recreation & Fitness Musical',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Recreation & Fitness Musical');
              },
            ),
            ListTile(
              leading: const Icon(Icons.music_note_rounded),
              title: Text(
                'Musical Instruments',
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                    context, categories, (home) => true,
                    arguments: 'Musical Instruments');
              },
            ),
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
