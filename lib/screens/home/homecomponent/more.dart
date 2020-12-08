import 'package:flutter/material.dart';

import 'package:sparknp/screens/home/homecomponent/morecard.dart';

import 'package:sparknp/widgets/appbar.dart';

class MoreScreen extends StatefulWidget {
  final String name;
  final front;
  final int subId;

  const MoreScreen({Key key, this.name, this.front, this.subId})
      : super(key: key);
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ItemCard(
        name: widget.name,
        front: widget.front,
        subId: widget.subId,
      ),
    );
  }
}
