import 'package:flutter/material.dart';
import 'package:sway_test/TimerText.dart';
import 'package:sway_test/UserForm.dart';
import 'package:sway_test/UserInfo.dart';
import 'dart:async';

import 'package:sway_test/sensor_collector.dart';

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
        body:UserForm()
      ),
    );
  }
}
