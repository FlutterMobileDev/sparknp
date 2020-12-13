import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/details/detailscomponents/comments.dart';
import 'package:sparknp/screens/details/detailscomponents/imageslider.dart';
import 'package:sparknp/services/frontservice.dart';
import 'package:sparknp/services/productservice.dart';
import 'package:sparknp/services/userservice.dart';
import 'package:sparknp/services/wishlistservice.dart';
import 'package:sparknp/services/storage.dart';

class DetailsBody extends StatefulWidget {
  final int productId;
  const DetailsBody(this.productId);
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final SecureStorage secureStorage = SecureStorage();
  var _product;
  var _user;

  String _token;
  String _comment;
  bool _loading;
  double rating = 3.5;

  var currency;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });

    ProductService.fetch(widget.productId).then((value) {
      setState(() {
        _product = value;
        _loading = false;
      });
    });

    FrontService.converter().then((value) {
      setState(() {
        currency = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ImageSlideScreen(_product),
                SizedBox(
                  height: 0.1,
                ),
                Container(
                    child: ListTile(
                  title: ListTile(
                    title: Text(
                      "Rs. ${(_product["price"] * currency).toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Rs. ${(_product["previous_price"] * currency).toStringAsFixed(0)}",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(CupertinoIcons.heart),
                        color: LightColor.orange,
                        onPressed: () {
                          (_token != null)
                              ? WishlistService.add(_token, _product["id"])
                                  .then((added) {
                                  _showDialog(context, true);
                                })
                              : _showDialog(context, false);
                        }),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _product["name"],
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // StarRating(
                      //   rating: rating,
                      //   onRatingChanged: (rating) => this.rating = rating,
                      // ),
                    ],
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                new Container(
                  decoration: new BoxDecoration(color: LightColor.primaryColor),
                  child: new TabBar(
                    indicatorWeight: 4,
                    indicatorColor: LightColor.lightBlue,
                    controller: _tabController,
                    tabs: [
                      new Tab(
                        icon: Icon(Icons.line_style),
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                      new Tab(
                        icon: Icon(Icons.comment),
                        child: Text(
                          'Comments',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: LightColor.lightBlue, width: 3)),
                  height: AppTheme.fullHeight(context) * 0.5,
                  child: new TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ListView.builder(
                          itemCount:
                              (_product["product_attributes"].length == null)
                                  ? 0
                                  : _product["product_attributes"].length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(
                                  _product["product_attributes"][index]["name"],
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  _product["product_attributes"][index]
                                      ["detail"],
                                ),
                              ),
                            );
                          }),
                      Comments(product: _product)
                      // ListView(children: [
                      //   Container(
                      //     width: AppTheme.fullWidth(context) * 0.7,
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //       color: LightColor.primaryColor.withOpacity(0.02),
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(
                      //         color: LightColor.primaryColor,
                      //         width: 1.5,
                      //       ),
                      //     ),
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //           enabledBorder: InputBorder.none,
                      //           focusedBorder: InputBorder.none,
                      //           hintText: "Comment",
                      //           prefixIcon: Icon(Icons.comment),
                      //           contentPadding: EdgeInsets.symmetric(
                      //             horizontal: 5,
                      //             vertical: 5,
                      //           )),
                      //       onSubmitted: (val) {
                      //         var data = {
                      //           "product_id": _product["id"],
                      //           "text": val
                      //         };
                      //         ProductService.addComment(_token, data)
                      //             .then((value) {
                      //           _showText(context, "Commented");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      //   ListView.builder(
                      //       physics: ScrollPhysics(),
                      //       shrinkWrap: true,
                      //       itemCount: (_product["comments"].length == null)
                      //           ? 0
                      //           : _product["comments"].length,
                      //       itemBuilder: (BuildContext context, index) {
                      //         setState(() {
                      //           _comload = true;
                      //           UserService.fetch(
                      //                   _product["comments"][index]["user_id"])
                      //               .then((value) {
                      //             _user = value;
                      //           });
                      //           _comload = false;
                      //         });
                      //         return Container(
                      //           child: Card(
                      //             child: ListTile(
                      //               isThreeLine: true,
                      //               title: Text(
                      //                 _user["name"],
                      //                 overflow: TextOverflow.ellipsis,
                      //               ),
                      //               subtitle: (_product["comments"][index]
                      //                           ["replies"]
                      //                       .isEmpty)
                      //                   ? Text(
                      //                       _product["comments"][index]["text"],
                      //                     )
                      //                   : Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           _product["comments"][index]
                      //                               ["text"],
                      //                         ),
                      //                         Text(
                      //                           "Tap to View Replies",
                      //                           style: TextStyle(
                      //                               fontSize: 14,
                      //                               fontWeight:
                      //                                   FontWeight.w300),
                      //                         ),
                      //                       ],
                      //                     ),
                      //               trailing: IconButton(
                      //                 icon: Icon(Icons.delete),
                      //                 onPressed: () {
                      //                   _remove(
                      //                           context,
                      //                           _token,
                      //                           _product["comments"][index]
                      //                               ["id"])
                      //                       .whenComplete(() {
                      //                     _showText(context, "Comment Deleted");
                      //                   });
                      //                 },
                      //               ),
                      //               onTap: (_product["comments"][index]
                      //                           ["replies"]
                      //                       .isEmpty)
                      //                   ? null
                      //                   : () {
                      //                       _showReply(
                      //                           context,
                      //                           _product["comments"][index]
                      //                               ["replies"]);
                      //                     },
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // ]),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
//TODO: Ratings

// typedef void RatingChangeCallback(double rating);

// class StarRating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//   final Color color;

//   StarRating(
//       {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = new Icon(
//         Icons.star_border,
//         color: Theme.of(context).buttonColor,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = new Icon(
//         Icons.star_half,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     } else {
//       icon = new Icon(
//         Icons.star,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     }
//     return new InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//         children:
//             new List.generate(starCount, (index) => buildStar(context, index)));
//   }
// }

Future<void> _showDialog(context, removed) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return removed
          ? AlertDialog(title: Text('Added to wishlist'))
          : AlertDialog(title: Text('Please Log In'));
    },
  );
}

Future<void> _remove(context, String _token, _commentId) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Delete Comment ?"),
        actions: [
          TextButton(
              onPressed: () {
                ProductService.delComment(_token, _commentId).then((value) {});
              },
              child: Text("YES")),
          TextButton(onPressed: null, child: Text("NO")),
        ],
      );
    },
  );
}

Future<void> _showText(context, String txt) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(title: Text(txt));
    },
  );
}

Future<void> _showReply(context, replies) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Replies'),
            content: Container(
              height: 300.0,
              width: 300.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: replies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('User ID: ${replies[index]["user_id"]}'),
                    subtitle: Text(replies[index]["text"]),
                  );
                },
              ),
            ));
      });
}
