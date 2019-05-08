import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:sway_test/main.dart';

class UserInfo {
  final accelerometer;
  int timer = 90;
  String fileName="";

  UserInfo() : this.accelerometer = [];


  void addData(String s) {
    accelerometer.add(s);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    this.fileName = '$path/data_${DateTime.now()}.txt';
    debugPrint(fileName);
    return File(fileName);
  }

  void writeToFile() async {
    final file = await _localFile;
    await file.writeAsString(accelerometer.join("\n"));
    accelerometer.clear();
  }

  void save() {
    writeToFile();
  }

  void reset() {
    accelerometer.clear();
  }

  void setTimer(String newValue) {
    this.timer = int.parse(newValue);
  }
}
