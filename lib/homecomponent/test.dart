import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            padding: EdgeInsets.all(8),
            height: 40,
            width: 45,
            decoration: BoxDecoration(
                color: Color(0xFF979797).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white)),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              right: 0,
              child: Container(
                height: 20,
                width: 22,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                  child: Text(
                    '${numOfitem}',
                    style:
                        TextStyle(fontSize: 10, height: 1, color: Colors.white),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
