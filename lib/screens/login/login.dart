import 'package:flutter/material.dart';
import 'package:sparknp/constants.dart';
import 'package:sparknp/screens/login/createacc.dart';
import 'package:sparknp/screens/login/forgetpw.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState(); //this
  //or State<StatefulWidget> createState(){  return _LoginScreenState(); }its same

}

class _LoginScreenState extends State<LoginScreen> {
  int i = 0;

  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLogged = false;

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
                Icons.email,
                color: Colors.white,
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
            obscureText: _obscureText,
            validator: (value) {
              if (value.isEmpty) {
                String a = 'Password Required';
                return a;
              }

              return null;
            },
            onSaved: (input) => _password = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
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

  //TODO: anon routing
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
        onPressed: () {},
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
      child: _isLogged
          ? null
          : FacebookSignInButton(
              onPressed: () {},
            ),
    );
  }

  Widget _buildGoogleLoginBtn(BuildContext context) {
    return Container(
      child: _isLogged
          ? null
          : GoogleSignInButton(
              onPressed: () {},
            ),
    );
  }

  //TODO: anon routing
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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Login'),
        ),
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
            Container(
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

  //TODO: connect

  // Future<void> signInWithEmailAndPassword(BuildContext context) async {
  //   if (_formkey.currentState.validate()) {
  //     _formkey.currentState.save();
  //     try {
  //       final currentUser = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: _email, password: _password)
  //           .catchError((err) {
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return AlertDialog(
  //                 title: Text("Error"),
  //                 content: Text(err.message),
  //                 actions: [
  //                   FlatButton(
  //                     child: Text("Ok"),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   )
  //                 ],
  //               );
  //             });
  //       });
  //       if (currentUser.user.isEmailVerified) {
  //         showAlertDialog(context, 'Email', 'User is Logged In', () {
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //         });

  //         print("User Verified");
  //       } else {
  //         showAlertDialog(context, 'Email', 'Email not Verified', () {
  //           Navigator.of(context).pop();
  //         });
  //         print("Not Verified");
  //       }
  //     } catch (e) {
  //       print(e.message);
  //     }
  //   }
  // }

  showAlertDialog(
      BuildContext context, String txt1, String txt2, Function function) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: function,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(txt1),
      content: Text(txt2),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
