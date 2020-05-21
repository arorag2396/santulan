import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:sway_test/evalute_sway.dart';
import 'package:sway_test/main.dart';

import 'SwayData.dart';

class UserInfo {
  List<String> accelerometer;
  List<SwayData> swayData;
  int timer = 45;
  String fileName = "";
  SwayData swayScore;
  List<SwayData> rmsData;

  UserInfo()
      : this.accelerometer = [],
        this.swayData = [];

  void addData(x, y, z) {
    accelerometer.add('$x $y $z');
    swayData.add(SwayData(x, y, z));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    this.fileName = '$path/data_${DateTime.now()}.txt';
    return File(fileName);
  }

  void writeToFile() async {
    final file = await _localFile;
    debugPrint("total length: ${accelerometer.length}");
    await file.writeAsString(accelerometer.join("\n"));
    reset();
  }

  void save() {
    swayScore = calculateSway(swayData);
    rmsData = getRmsData(swayData);
    writeToFile();
  }

  void reset() {
    accelerometer.clear();
    swayData.clear();

  }

  void setTimer(String newValue) {
    this.timer = int.parse(newValue);
  }
}
