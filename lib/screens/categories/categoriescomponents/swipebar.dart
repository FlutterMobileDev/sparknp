import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';

class SwipeBar extends StatefulWidget {
  final Category category;

  const SwipeBar({Key key, this.category}) : super(key: key);

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
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.category.subs.length,
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
                          widget.category.subs[index].name,
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
          // ItemCard(subcat: widget.category.subs[selectedIndex]),
        ],
      ),
    );
  }
}
