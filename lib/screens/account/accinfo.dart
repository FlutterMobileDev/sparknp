import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';

import 'package:sparknp/services/storage.dart';

class AccInfo extends StatefulWidget {
  @override
  _AccInfoState createState() => _AccInfoState();
}

class _AccInfoState extends State<AccInfo> {
  bool _loading = true;

  final SecureStorage secureStorage = SecureStorage();

  String _name, _email, _address, _phone;
  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('name').then((value) {
      setState(() {
        _name = value;
      });
    });
    secureStorage.readData('email').then((value) {
      setState(() {
        _email = value;
      });
    });
    secureStorage.readData('phone').then((value) {
      setState(() {
        _phone = value;
      });
    });
    secureStorage.readData('address').then((value) {
      setState(() {
        _address = value;
      });
    });
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return (_loading)
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Account Information"),
              backgroundColor: LightColor.mainColor,
            ),
            body: SizedBox.expand(
              child: Container(
                color: LightColor.lightGrey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text('Name'),
                        trailing: Text(_name),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text('Mobile'),
                        trailing: Text(_phone),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text('Email'),
                        trailing: Text(_email),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text('Address'),
                        trailing: Text(_address),
                        onTap: () {},
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      thickness: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
