import 'package:flutter/material.dart';

import 'package:sparknp/router.dart';
import 'package:sparknp/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routing.generateRoute,
      // home: Bottomnavbar(),
      initialRoute: splash,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
