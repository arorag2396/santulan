import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sway_test/UserInfo.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter/foundation.dart';

class TimerText extends StatefulWidget {
  TimerText({
    this.stopwatch,
    this.totalSeconds,
    this.timerCompleteCallback,
    this.userInfo,
  });

  final Stopwatch stopwatch;
  final num totalSeconds;
  final timerCompleteCallback;
  final UserInfo userInfo;

  TimerTextState createState() => new TimerTextState(
        stopwatch: stopwatch,
        totalSeconds: totalSeconds,
        timerCompleteCallback: timerCompleteCallback,
        userInfo: userInfo,
      );
}

class TimerTextState extends State<TimerText> {
  Timer timer;
  final Stopwatch stopwatch;
  final num totalSeconds;
  final timerCompleteCallback;
  final UserInfo userInfo;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (stopwatch.isRunning) {
        setState(() {
          userInfo.addData('${event.x} ${event.y} ${event.z}');
        });
      }
    });
  }

  TimerTextState({
    this.stopwatch,
    this.totalSeconds,
    this.timerCompleteCallback,
    this.userInfo,
  }) {
    debugPrint("Created");
    timer = new Timer.periodic(new Duration(seconds: 1), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
    if ((!stopwatch.isRunning && stopwatch.elapsedMilliseconds > 0) ||
        stopwatch.elapsedMilliseconds >= userInfo.timer * 1000) {
      timer.cancel();
      stopwatch.reset();
      timerCompleteCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle =
        const TextStyle(fontSize: 60.0, fontFamily: "Open Sans");
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds, totalSeconds);

    return new Text(formattedTime, style: timerTextStyle);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class TimerTextFormatter {
  static String format(int milliseconds, int totalSeconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    return (totalSeconds - (seconds % 60)).toString().padLeft(2, '0');
  }
}
