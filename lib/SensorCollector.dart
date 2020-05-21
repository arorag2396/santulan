// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:sensors/sensors.dart';
import 'package:sway_test/ScatterPlot.dart';
import 'package:sway_test/UserInfo.dart';

import 'TimerText.dart';

class SensorCollectorMaterialApp extends StatelessWidget {
  UserInfo userInfo;
  Stopwatch stopwatch;

  SensorCollectorMaterialApp(this.userInfo, this.stopwatch);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sway Test';
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SensorCollector(this.userInfo, this.stopwatch));
  }
}

class SensorCollector extends StatelessWidget {
  UserInfo userInfo;
  Stopwatch stopwatch;

  SensorCollector(this.userInfo, this.stopwatch);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Column(
            children: [
              TimerText(
                stopwatch: stopwatch,
                totalSeconds: userInfo.timer,
                timerCompleteCallback: () {
                  stopwatch.stop();
                  debugPrint('${userInfo.accelerometer.length}');
                  userInfo.save();
                },
                userInfo: userInfo,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Start"),
                    onPressed: () => stopwatch.start(),
                  ),
                  RaisedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      stopwatch.stop();
                    },
                  ),
                ],
              ),
              RaisedButton(
                child: Text("Show result"),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text("${userInfo.swayScore}"),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
              RaisedButton(
                child: Text("Sway chart"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: Text("Sway chart"),
                            ),
                            body: SimpleScatterPlotChart.withUserInfo(
                                userInfo.rmsData))),
                  );
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
