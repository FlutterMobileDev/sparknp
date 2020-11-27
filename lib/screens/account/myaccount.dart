import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/services/storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SecureStorage secureStorage = SecureStorage();
  bool _loading;

  String _name = " ";
  String _email = " ";
  String _phone = " ";
  String _address = " ";

  @override
  void initState() {
    super.initState();
    _loading = true;
    secureStorage.readData('name').then((value) {
      setState(() {
        if (value != null) _name = value;
      });
    });
    secureStorage.readData('email').then((value) {
      setState(() {
        if (value != null) _email = value;
      });
    });
    secureStorage.readData('phone').then((value) {
      setState(() {
        if (value != null) _phone = value;
      });
    });
    secureStorage.readData('address').then((value) {
      setState(() {
        if (value != null) _address = value;
      });
    });
    _loading = false;
  }

  Widget _blueColors() {
    return Positioned(
      child: Container(
        color: LightColor.mainColor,
        height: 230,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  _name,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Positioned(
      top: 230,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: LightColor.lightGrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            "My Account",
            style: TextStyle(
                color: LightColor.background, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: LightColor.mainColor,
          centerTitle: true,
        ),
        body: (_loading)
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    _blueColors(),
                    _getInfo(),
                    _buildInfo(context),
                  ],
                ),
              ),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 125, 0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.blue[300],
              textColor: Colors.white,
              child: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              onPressed: () {
                secureStorage.deleteData("name");
                secureStorage.deleteData("address");
                secureStorage.deleteData("phone");
                secureStorage.deleteData("email");
                secureStorage.deleteData("token");
                Navigator.popAndPushNamed(context, home);
              },
            ),
          ),
        ]);
  }
}
