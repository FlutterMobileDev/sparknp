import 'package:flutter/material.dart';
import 'package:sparknp/model/frontjson.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

// TODO: category product
class ItemCard extends StatelessWidget {
  final Sub subcat;
  const ItemCard({
    Key key,
    this.subcat,
  }) : super(key: key);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(subcat.name)),
      // GridView.builder(
      //   physics: ScrollPhysics(),
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemCount: _productList.length,
      //   itemBuilder: (context, index) {
      //     dynamic product = _productList[index];
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.pushNamed(context, details, arguments: product);
      //       },
      //       child: Padding(
      //         padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Expanded(
      //               child: Container(
      //                 height: 180,
      //                 width: 180,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 child: Image.network(
      //                   imgpath + product.thumbnail,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               height: 50,
      //               width: 180,
      //               decoration: BoxDecoration(
      //                   color: LightColor.background,
      //                   borderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(10),
      //                     bottomRight: Radius.circular(10),
      //                   ),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       offset: Offset(0, 10),
      //                       blurRadius: 50,
      //                       color: LightColor.primaryColor.withOpacity(0.23),
      //                     ),
      //                   ]),
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         vertical: defaultPadding / 4,
      //                         horizontal: defaultPadding / 4),
      //                     child: Text(
      //                       // products is out demo list
      //                       product.name.toUpperCase(),
      //                       style: TextStyle(color: LightColor.textLightColor),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                   ),
      //                   Text(
      //                     "\Rs ${product.price}",
      //                     overflow: TextOverflow.ellipsis,
      //                     style: TextStyle(fontWeight: FontWeight.bold),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
