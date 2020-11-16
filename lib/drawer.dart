import 'package:flutter/material.dart';
import 'package:sparknp/model/category.dart';

import 'package:sparknp/router.dart';

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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Men's Fashion",
                    subcat: [
                      "Bags",
                      "Clothing",
                      "Shoes",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Men's Fashion",
                    subcat: [
                      "Bags",
                      "Clothing",
                      "Shoes",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Electronic Devices",
                    subcat: [
                      "Mobiles",
                      "Laptops",
                      "Tablets",
                      "Desktops",
                      "Printers",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Electronic Accessories",
                    subcat: [
                      "Mobile Accessories",
                      "Audio",
                      "Desktop Accessories",
                      "Network Components",
                      "Storage",
                      "Wearables",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Camera & Photo",
                    subcat: [
                      "Action & Video Cameras",
                      "Security Cameras",
                      "DSLR Cameras",
                      "Instant Cameras",
                      "Camera Accessories",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Sport & Outdoor",
                    subcat: [
                      "Men's Shoes",
                      "Women's Shoes",
                      "Exercise & Fitness",
                      "Water Sport",
                      "Water Bottles",
                      "Outdoor recreation",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Health & Beauty",
                    subcat: ["Bath & Body"],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Watches & Accessories",
                    subcat: [
                      "Men's Watches",
                      "Women's Watches",
                      "Kids' Watches",
                      "Sunglasses",
                      "Eyeglasses",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Books & Office",
                    subcat: [
                      "Books",
                      "Office Supplies",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Baby & Toys",
                    subcat: [
                      "Baby Gear",
                      "Baby Personal Care",
                      "Baby Food",
                      "Toys",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Automobile & Motorcycles",
                    subcat: [
                      "Automobile",
                      "Motorcycles",
                      "Auto Care",
                      "Motorcycle Riding Gear",
                      "Parts & Accessories",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Home, Lifestyle, decoration & Appliances",
                    subcat: [
                      "Bath",
                      "Bedding",
                      "Shoes",
                      "Decor",
                      "Furniture",
                      "Lighting",
                      "Kitchen & Dining",
                      "Laundry",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Groceries & Pets",
                    subcat: [
                      "Beverages",
                      "Breakfast & Snacks",
                      "Tobacco",
                      "Alcoholic Beverages",
                      "Pet Supplies",
                    ],
                  ),
                );
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
                  context,
                  categories,
                  (home) => true,
                  arguments: Category(
                    name: "Musical Instruments",
                    subcat: [
                      "Guitars",
                      "Drums & Percussions",
                      "Keypads & Pianos",
                    ],
                  ),
                );
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
