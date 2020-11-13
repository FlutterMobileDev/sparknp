import 'package:flutter/material.dart';

import 'router.dart';
import 'home.dart';
import 'drawer.dart';
// import 'myaccount.dart';
// import 'accsettings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
      onGenerateRoute: Routing.generateRoute,
      initialRoute: home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
