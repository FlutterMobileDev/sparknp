import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, accInfo, (route) => true);
            },
          )
        ],
      ),
    );
  }
}
