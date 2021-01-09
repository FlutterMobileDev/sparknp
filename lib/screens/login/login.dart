import 'dart:convert';
import 'dart:convert' as JSON;

import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/login/createacc.dart';
import 'package:sparknp/screens/login/forgetpw.dart';
import 'package:sparknp/services/loginservice.dart';
import 'package:http/http.dart' as http;

import 'package:sparknp/services/storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int i = 0;

  GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          "1061048219242-8knfc4bbji43lt7a6msslsqhco4i5qnf.apps.googleusercontent.com");

  String _email, _password;
  GoogleSignInAccount _currentUser;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map userProfile;
  final facebookLogin = FacebookLogin();

  bool _obscureText = true;
  bool _isLogged = false;

  final SecureStorage secureStorage = SecureStorage();

  Widget _buildEmailTF() {
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
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: LightColor.lightGrey,
              ),
              hintText: 'Enter your Email',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Password is required';
                return a;
              }
              return null;
            },
            onSaved: (input) => _password = input,
            obscureText: _obscureText,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: LightColor.lightGrey,
              ),
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ForgetPwdScreen())),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: labelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _handleLogin();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  Widget _buildFBLoginBtn(BuildContext context) {
    return Container(
      child: FacebookSignInButton(
        onPressed: _loginWithFB,
      ),
    );
  }

  Widget _buildGoogleLoginBtn(BuildContext context) {
    return Container(
      child: GoogleSignInButton(
        onPressed: _loginWithGoogle,
      ),
    );
  }

  Widget _buildSignupBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateScreen())),
        padding: EdgeInsets.only(right: 0.0),
        child: Text("Don't have an account? Sign up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: <Widget>[
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
            (_isLogged)
                ? Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Text(
                              "Already Logged In",
                              style: TextStyle(
                                  fontSize: 32, color: LightColor.lightGrey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
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
                                setState(() {
                                  _isLogged = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _buildPasswordTF(),
                            _buildForgotPasswordBtn(context),
                            _buildLoginBtn(context),
                            _buildFBLoginBtn(context),
                            SizedBox(height: 10.0),
                            _buildGoogleLoginBtn(context),
                            _buildSignupBtn(context),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ));
  }

  void _handleLogin() async {
    print("here");
    var data = {
      "credential_type": "normal",
      "email": emailController.text,
      "password": passwordController.text,
    };

    var res = await CallApi().login(data, 'app-login');
    var body = json.decode(res.body);

    if (body["status"] == true) {
      secureStorage.writeData("id", body["user"]["id"].toString());
      secureStorage.writeData("name", body["user"]["name"]);
      secureStorage.writeData("address", body["user"]["address"]);
      secureStorage.writeData("phone", body["user"]["phone"]);
      secureStorage.writeData("email", body["user"]["email"]);
      secureStorage.writeData("token", body["user_token"]);
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, splash);
      setState(() {
        _isLogged = true;
      });
    } else {
      showAlertDialog(context, "Incorrect e-mail or password",
          "Please check email and password");
    }
  }

  void _loginWithGoogle() async {
    await _googleSignIn.signOut();
    GoogleSignInAccount user = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleauth = await user.authentication;

    var data = {
      "credential_type": "google",
      "google_token": googleauth.accessToken,
      "email": user.email,
      "name": user.displayName,
      "google_id": user.id
    };

    var res = await CallApi().login(data, 'app-login');
    var body = json.decode(res.body);

    if (body["status"] == true) {
      secureStorage.writeData("id", body["user"]["id"].toString());
      secureStorage.writeData("name", _googleSignIn.currentUser.displayName);
      secureStorage.writeData("email", _googleSignIn.currentUser.email);
      secureStorage.writeData("token", body["user"]["user_token"]);
      setState(() {
        _isLogged = true;
      });
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, splash);
    } else {
      showAlertDialog(context, "Error", "Log in Unsuccessful");
    }
  }

  void _loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);

        var data = {
          "credential_type": "facebook",
          "facebook_token": token,
          "email": profile["email"],
          "name": profile["name"],
          "facebook_id": profile["id"],
        };

        var res = await CallApi().login(data, 'app-login');
        var body = json.decode(res.body);

        if (body["status"] == true) {
          secureStorage.writeData("id", body["user"]["id"].toString());
          secureStorage.writeData("name", profile["name"]);
          secureStorage.writeData("email", profile["email"]);
          secureStorage.writeData("photo", profile["picture"]["data"]["url"]);
          secureStorage.writeData("token", body["user"]["user_token"]);
          setState(() {
            _isLogged = true;
          });
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, splash);
        } else {
          showAlertDialog(context, "Error", "Log in Unsuccessful");
        }
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLogged = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLogged = false);
        break;
    }
  }

  showAlertDialog(BuildContext context, String txt1, String txt2) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(txt1),
      content: Text(txt2),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
