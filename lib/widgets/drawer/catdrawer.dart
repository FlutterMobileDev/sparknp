import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/category.dart';

import 'package:sparknp/router.dart';

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
              style: TextStyle(color: LightColor.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: LightColor.black,
              ),
              onPressed: goBack,
            ),
            backgroundColor: LightColor.mainColor,
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
