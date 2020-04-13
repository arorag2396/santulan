import 'package:flutter/material.dart';
import 'package:sway_test/MainScreen.dart';
import 'package:sway_test/UserInfo.dart';

UserInfo userInfo = UserInfo();

void main() => runApp(MyApp());

Stopwatch stopwatch = new Stopwatch();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sway Test';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: UserForm()),
    );
  }
}
