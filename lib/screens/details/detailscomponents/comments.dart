import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/services/productservice.dart';
import 'package:sparknp/services/userservice.dart';

import 'package:sparknp/services/storage.dart';

class Comments extends StatefulWidget {
  final product;
  Comments({Key key, this.product}) : super(key: key);
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final SecureStorage secureStorage = SecureStorage();

  bool _loading;

  String _token;
  String _id;

  var _userId = [];

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
      secureStorage.readData('id').then((value) {
        setState(() {
          _id = value;
        });
        for (int i = 0; i < widget.product["comments"].length; i++) {
          _userId.add(widget.product["comments"][i]["user_id"]);
          setState(() {
            _loading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (_token == null)
                    ? null
                    : Container(
                        width: AppTheme.fullWidth(context) * 0.7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: LightColor.primaryColor.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: LightColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Comment",
                              prefixIcon: Icon(Icons.comment),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              )),
                          onSubmitted: (val) {
                            var data = {
                              "product_id": widget.product["id"],
                              "text": val
                            };
                            ProductService.addComment(_token, data)
                                .then((value) {
                              _showText(context, "Commented");
                            });
                          },
                        ),
                      ),
              ),
              FutureBuilder(
                future: UserService.fetch(_userId),
                // ignore: missing_return
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case ConnectionState.done:
                      return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (snapshot.data.length == null)
                            ? 0
                            : snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            child: Card(
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(
                                  snapshot.data[index]["user"]["name"],
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: (widget
                                        .product["comments"][index]["replies"]
                                        .isEmpty)
                                    ? Text(
                                        widget.product["comments"][index]
                                            ["text"],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.product["comments"][index]
                                                ["text"],
                                          ),
                                          Text(
                                            "Tap to View Replies",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                trailing: (_token == null)
                                    ? null
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.reply),
                                            onPressed: () {
                                              _showReply(
                                                  context,
                                                  widget.product["comments"]
                                                      [index]["replies"],
                                                  widget.product["comments"]
                                                      [index]["id"]);
                                            },
                                          ),
                                          (snapshot.data[index]["user"]["id"]
                                                      .toString() !=
                                                  _id)
                                              ? IconButton(
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.transparent,
                                                  onPressed: () {},
                                                )
                                              : IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    _remove(
                                                        context,
                                                        _token,
                                                        widget.product[
                                                                "comments"]
                                                            [index]["id"],
                                                        false);
                                                  },
                                                ),
                                        ],
                                      ),
                                onTap: (widget
                                        .product["comments"][index]["replies"]
                                        .isEmpty)
                                    ? null
                                    : () {
                                        _showReply(
                                            context,
                                            widget.product["comments"][index]
                                                ["replies"],
                                            widget.product["comments"][index]
                                                ["id"]);
                                      },
                              ),
                            ),
                          );
                        },
                      );
                    default:
                  }
                },
              ),
            ],
          );
  }

  Future<void> _remove(context, String _token, _commentId, isReply) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return (isReply)
            ? AlertDialog(
                title: Text("Delete Reply ?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        ProductService.delReply(_token, _commentId)
                            .then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Text("YES")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("NO")),
                ],
              )
            : AlertDialog(
                title: Text("Delete Comment ?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        ProductService.delComment(_token, _commentId)
                            .whenComplete(() {
                          _showText(context, "Comment Deleted");
                        });
                      },
                      child: Text("YES")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("NO")),
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

  Future<void> _showReply(context, replies, commentId) async {
    List _replyId = [];
    for (int i = 0; i < replies.length; i++) {
      setState(() {
        _replyId.add(replies[i]["user_id"]);
      });
    }
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return FutureBuilder(
              future: UserService.fetch(_replyId),
              // ignore: missing_return
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return AlertDialog(
                      title: Text('Replies'),
                      content: Container(
                        height: 300.0,
                        width: 300.0,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  case ConnectionState.done:
                    return (snapshot.hasError)
                        ? AlertDialog(
                            title: Text(
                              "Connect to the Internet",
                              style: AppTheme.h1Style,
                            ),
                          )
                        : AlertDialog(
                            title: Text('Replies'),
                            content: Container(
                              height: 300.0,
                              width: 300.0,
                              child: ListView(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (_token == null)
                                      ? null
                                      : Container(
                                          width:
                                              AppTheme.fullWidth(context) * 0.7,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: LightColor.primaryColor
                                                .withOpacity(0.02),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: LightColor.primaryColor,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintText: "Reply",
                                                prefixIcon: Icon(Icons.comment),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 5,
                                                )),
                                            onSubmitted: (val) {
                                              var data = {
                                                "comment_id": commentId,
                                                "text": val
                                              };
                                              ProductService.addReply(
                                                      _token, data)
                                                  .then((value) {
                                                _showText(context, "Commented");
                                              });
                                            },
                                          ),
                                        ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: replies.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                          snapshot.data[index]["user"]["name"]),
                                      subtitle: Text(replies[index]["text"]),
                                      trailing: (snapshot.data[index]["user"]
                                                      ["id"]
                                                  .toString() !=
                                              _id)
                                          ? null
                                          : IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                _remove(
                                                        context,
                                                        _token,
                                                        replies[index]["id"],
                                                        true)
                                                    .whenComplete(() {
                                                  _showText(
                                                      context, "Reply Deleted");
                                                });
                                              },
                                            ),
                                    );
                                  },
                                ),
                              ]),
                            ),
                          );
                  default:
                }
              });
        });
  }
}
