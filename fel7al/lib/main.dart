import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';
import 'globals.dart' as globals;

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globals.appNavigator,
      home: mainpage(),
    );
  }
}