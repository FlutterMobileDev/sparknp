import 'package:flutter/material.dart';

import 'package:sparknp/constants.dart';
import 'package:sparknp/router.dart';

import 'package:sparknp/services/cartservice.dart';

import 'package:sparknp/services/storage.dart';

class ProcessScreen extends StatefulWidget {
  @override
  _ProcessScreenState createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  final SecureStorage secureStorage = SecureStorage();
  String _token, _totalPrice;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    secureStorage.readData('token').then((value) {
      _token = value;
    });
    secureStorage.readData('totalPrice').then((value) {
      _totalPrice = value;
    });
  }

  String _name, _email, _phone, _address, _zipcode, _city;

  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  Widget _buildCustomerNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Name is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _name = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Name',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Email is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _email = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              hintText: 'Enter Email Address',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Phone Number is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _phone = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Enter Phone Number',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerAddressTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ship Address',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: addressController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Address is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _address = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              hintText: 'Enter Address',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerCityTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'City Name',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: cityController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'City Name is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _city = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.location_city,
                color: Colors.white,
              ),
              hintText: 'Enter City Name',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerPostalCodeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Zip Code',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: zipController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Zip code is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _zipcode = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.markunread_mailbox_outlined,
                color: Colors.white,
              ),
              hintText: 'Enter Postal Code',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          var data = {
            "personal_name": nameController.text,
            "personal_email": emailController.text,
            "shipping": "shipto",
            "pickup_location": addressController.text,
            "name": nameController.text,
            "phone": phoneController.text,
            "email": emailController.text,
            "address": addressController.text,
            "customer_country": "Nepal",
            "city": cityController.text,
            "zip": zipController.text,
            "shipping_name": null,
            "shipping_email": null,
            "shipping_phone": null,
            "shipping_address": null,
            "shipping_country": null,
            "shipping_city": null,
            "shipping_zip": null,
            "order_notes": null,
            "method": "Cash On Delivery",
            "shipping_cost": "0",
            "packing_cost": "0",
            "dp": "0",
            "tax": "0",
            "totalQty": "0",
            "vendor_shipping_id": "0",
            "vendor_packing_id": "0",
            "total": _totalPrice,
            "coupon_code": null,
            "coupon_discount": null,
            "coupon_id": null,
          };
          CartService.process(_token, data).then((data) {
            if (data["status"] = true) {
              _showDialog(context, data["message"]).whenComplete(() {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, splash);
              });
            }
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Proceed',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              )),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 11.0,
                ),
                child: Form(
                  key: _formkey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Billing Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildCustomerNameTF(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildCustomerEmailTF(),
                      SizedBox(
                        height: 15,
                      ),
                      _buildCustomerPhoneTF(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildCustomerAddressTF(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildCustomerCityTF(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildCustomerPostalCodeTF(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildSaveBtn(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    super.dispose();
  }
}

Future<void> _showDialog(context, txt) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(txt),
      );
    },
  );
}
