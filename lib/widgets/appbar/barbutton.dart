import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparknp/constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.svgSrc,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            height: 32,
            width: 37,
            decoration: BoxDecoration(
                color: LightColor.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
                border:
                    Border.all(width: 1.5, color: LightColor.textLightColor)),
            child: SvgPicture.asset(
              svgSrc,
              color: LightColor.textLightColor,
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              right: 0,
              child: Container(
                height: 20,
                width: 22,
                decoration: BoxDecoration(
                    color: LightColor.orange,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.5, color: LightColor.background)),
                child: Center(
                  child: Text(
                    '$numOfitem',
                    style: TextStyle(
                        fontSize: 10, height: 1, color: LightColor.background),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
