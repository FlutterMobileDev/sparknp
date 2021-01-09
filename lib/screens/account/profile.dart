import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/services/storage.dart';
import 'package:url_launcher/url_launcher.dart';

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
        (value != null) ? _phone = value : _phone = null;
      });
    });
    secureStorage.readData('address').then((value) {
      setState(() {
        (value != null) ? _address = value : _address = null;
      });
    });
    _loading = false;
  }

  Widget _blueColors() {
    return Positioned(
      child: Container(
        color: LightColor.primaryColor,
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
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    _name,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
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
          children: (_phone == null)
              ? [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text('Email'),
                      trailing: Text(_email),
                    ),
                  ),
                ]
              : [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text('Email'),
                      trailing: Text(_email),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text('Mobile'),
                      trailing: Text(_phone),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text('Address'),
                      trailing: Text(_address),
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

  Widget _buildOrdersBtn(BuildContext context) {
    return Positioned(
      top: (_phone != null) ? 430 : 300,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(color: LightColor.lightGrey),
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.pushNamed(context, myOrders);
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.orange[600],
          child: Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVendorBtn(BuildContext context) {
    return Positioned(
      top: (_phone != null) ? 510 : 380,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(color: LightColor.lightGrey),
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            _launchURL();
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.orange[600],
          child: Text(
            'Become a Vendor',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    _buildOrdersBtn(context),
                    _buildVendorBtn(context),
                  ],
                ),
              ),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 125, 0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.orange[600],
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
                Navigator.popAndPushNamed(context, splash);
              },
            ),
          ),
        ]);
  }

  _launchURL() async {
    const url = 'https://sparknp.com/user/package';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
