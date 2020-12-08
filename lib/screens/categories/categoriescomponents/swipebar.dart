import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/categories/categoriescomponents/subcatcard.dart';

class SwipeBar extends StatefulWidget {
  final List categories;

  const SwipeBar({Key key, this.categories}) : super(key: key);

  @override
  _SwipeBarState createState() => _SwipeBarState();
}

class _SwipeBarState extends State<SwipeBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: AppTheme.fullHeight(context) * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.categories[index]["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? LightColor.textColor
                                : LightColor.textLightColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: defaultPadding / 4),
                          height: 2,
                          width: 30,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SubCatCard(subId: widget.categories[selectedIndex]["id"]),
        ],
      ),
    );
  }
}
