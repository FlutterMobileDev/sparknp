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

  var _user;

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('token').then((value) {
      setState(() {
        _token = value;
      });
    });

    for (int i = 0; i < widget.product["comments"].length; i++) {
      setState(() {
        UserService.fetch(widget.product["comments"][i]["user_id"], _token)
            .then((value) {
          _user.add(value);
        });
        print('_user');
        print(_user);
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Center(child: CircularProgressIndicator())
        : ListView(children: [
            Container(
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
                  var data = {"product_id": widget.product["id"], "text": val};
                  ProductService.addComment(_token, data).then((value) {
                    _showText(context, "Commented");
                  });
                },
              ),
            ),
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: (widget.product["comments"].length == null)
                    ? 0
                    : widget.product["comments"].length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          'User ID:  ${widget.product["comments"][index]["user_id"].toString()}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: (widget
                                .product["comments"][index]["replies"].isEmpty)
                            ? Text(
                                widget.product["comments"][index]["text"],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product["comments"][index]["text"],
                                  ),
                                  Text(
                                    "Tap to View Replies",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _remove(context, _token,
                                    widget.product["comments"][index]["id"])
                                .whenComplete(() {
                              _showText(context, "Comment Deleted");
                            });
                          },
                        ),
                        onTap: (widget
                                .product["comments"][index]["replies"].isEmpty)
                            ? null
                            : () {
                                _showReply(
                                    context,
                                    widget.product["comments"][index]
                                        ["replies"]);
                              },
                      ),
                    ),
                  );
                }),
          ]);
  }
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
