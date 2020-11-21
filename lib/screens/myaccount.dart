import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name, userID;
  @override
  void initState() {
    super.initState();
  }

  Widget _blueColors() {
    return Positioned(
      child: Container(
        color: Colors.indigo[900],
        height: 230,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      child: Container(
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
                  CircleAvatar(radius: 60, backgroundImage: null),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Name: $_name",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(""),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrders(BuildContext context) {
    return Positioned(
      top: 230,
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "My Orders",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 210),
                  Container(
                    alignment: Alignment.topRight,
                    child: ButtonTheme(
                      height: 18,
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: Colors.indigo[900],
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          'View All >',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.card_membership),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.local_shipping),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.motorcycle),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.rate_review),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text('To Pay'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('To ship'),
                  SizedBox(
                    width: 40,
                  ),
                  Text('To Receive'),
                  SizedBox(
                    width: 40,
                  ),
                  Text('To Reveiw'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    icon: Icon(Icons.assignment_return),
                    onPressed: () {},
                  ),
                  Text('My Returns'),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                  Text('My Cancellations'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildService(BuildContext context) {
    return Positioned(
      top: 400,
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "My Services",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.rate_review),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.payment),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Messages'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('My Reveiw'),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Payment Options'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Help'),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _blueColors(),
            _getInfo(),
            _buildOrders(context),
            _buildService(context),
          ],
        ),
      ),
    );
  }
}
