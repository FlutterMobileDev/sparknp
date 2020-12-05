import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/model/screenarguments.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({Key key, this.name, this.front, this.subId})
      : super(key: key);
  final String name;
  final ApiFront front;
  final int subId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: name),
          Spacer(),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: LightColor.primaryColor),
            ),
            color: Colors.white.withOpacity(0.6),
            onPressed: () {
              Navigator.pushNamed(
                context,
                more,
                arguments: ScreenArguments(name: name, front: front, id: subId),
              );
            },
            child: Text(
              "More",
              style: TextStyle(color: LightColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.65,
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding / 4),
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          // width: 400,
          //     margin: EdgeInsets.only(right: defaultPadding / 4),
          //     height: 7,
          //     color: LightColor.primaryColor.withOpacity(0.2),
          //   ),
          // )
        ],
      ),
    );
  }
}
