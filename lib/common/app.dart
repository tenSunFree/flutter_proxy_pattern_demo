import 'package:flutter/material.dart';
import 'file:///C:/FlutterProxyPatternDemo/flutter_proxy_pattern_demo/lib/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterProxyPatternDemo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: HomeScreen());
  }
}
