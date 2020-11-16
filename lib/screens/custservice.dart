import 'package:flutter/material.dart';

import 'package:sparknp/widgets/appbar/appbar.dart';

class CustService extends StatefulWidget {
  @override
  _CustServiceState createState() => _CustServiceState();
}

class _CustServiceState extends State<CustService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }
}
