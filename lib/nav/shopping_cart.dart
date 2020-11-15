// import 'package:flutter/material.dart';

// import 'package:sparknp/model/data.dart';
// import 'package:sparknp/model/product.dart';
// // import 'package:sparknp/widgets/title_text.dart';

// class ShoppingCartPage extends StatelessWidget {
//   const ShoppingCartPage({Key key}) : super(key: key);

//   Widget _cartItems() {
//     return Column(children: AppData.cartList.map((x) => _item(x)).toList());
//   }

//   Widget _item(Product model) {
//     return Container(
//       height: 80,
//       child: Row(
//         children: <Widget>[
//           AspectRatio(
//             aspectRatio: 1.2,
//             child: Stack(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Container(
//                     height: 70,
//                     width: 70,
//                     child: Stack(
//                       children: <Widget>[
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xffE1E2E4),
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: -20,
//                   bottom: -20,
//                   child: Image.asset(model.image),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//               child: ListTile(
//                   title: TitleText(
//                     text: model.name,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   subtitle: Row(
//                     children: <Widget>[
//                       TitleText(
//                         text: '\$ ',
//                         color: Color(0xffF72804),
//                         fontSize: 12,
//                       ),
//                       TitleText(
//                         text: model.price.toString(),
//                         fontSize: 14,
//                       ),
//                     ],
//                   ),
//                   trailing: Container(
//                     width: 35,
//                     height: 35,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Color(0xffE1E2E4).withAlpha(150),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: TitleText(
//                       text: 'x${model.id}',
//                       fontSize: 12,
//                     ),
//                   )))
//         ],
//       ),
//     );
//   }

//   Widget _price() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         TitleText(
//           text: '${AppData.cartList.length} Items',
//           color: Color(0xffA1A3A6),
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//         TitleText(
//           text: '\$${getPrice()}',
//           fontSize: 18,
//         ),
//       ],
//     );
//   }

//   Widget _submitButton(BuildContext context) {
//     return FlatButton(
//         onPressed: () {},
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         color: Color(0xffE65829),
//         child: Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(vertical: 12),
//           width: MediaQuery.of(context).size.width * .7,
//           child: TitleText(
//             text: 'Next',
//             color: Color(0XFFFFFFFF),
//             fontWeight: FontWeight.w500,
//           ),
//         ));
//   }

//   double getPrice() {
//     double price = 0;
//     AppData.cartList.forEach((x) {
//       price += x.price * x.id;
//     });
//     return price;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             _cartItems(),
//             Divider(
//               thickness: 1,
//               height: 70,
//             ),
//             _price(),
//             SizedBox(height: 30),
//             _submitButton(context),
//           ],
//         ),
//       ),
//     );
//   }
// }
