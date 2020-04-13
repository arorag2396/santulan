import 'dart:math';

import 'package:sway_test/SwayData.dart';

num sum(num a, num b) {
  return a + b;
}

List<num> runningAverage(List<num> x, {int N = 10}) {
  List<num> y;
  for (int i = 0; i < x.length - N + 1; i++) {
    y.add(x.sublist(i, i + N).reduce(sum));
  }
  return y;
}

List<num> deviation(List<num> x, num dev) {
  return x.map((a) => pow(dev - a, 2)).toList();
}

SwayData calculateSway(List<SwayData> swayDataList) {
  List<num> x = [];
  List<num> y = [];
  List<num> z = [];

  swayDataList.forEach((data) => {x.add(data.x), y.add(data.y), z.add(data.z)});

  num xMean = x.reduce(sum) / x.length;
  num yMean = y.reduce(sum) / y.length;
  num zMean = z.reduce(sum) / z.length;

  var xDev = deviation(x, xMean);
  var yDev = deviation(y, yMean);
  var zDev = deviation(z, zMean);

  var xRms = sqrt(xDev.reduce(sum)) / xDev.length;
  var yRms = sqrt(yDev.reduce(sum)) / yDev.length;
  var zRms = sqrt(zDev.reduce(sum)) / zDev.length;
  return SwayData(xRms, yRms, zRms);
}

List<SwayData> getRmsData(List<SwayData> swayDataList) {
  List<num> x = [];
  List<num> y = [];
  List<num> z = [];

  swayDataList.forEach((data) => {x.add(data.x), y.add(data.y), z.add(data.z)});

  num xMean = x.reduce(sum) / x.length;
  num yMean = y.reduce(sum) / y.length;
  num zMean = z.reduce(sum) / z.length;

  var xRms = x.map((a) => a - xMean).toList();
  var yRms = y.map((a) => a - yMean).toList();
  var zRms = z.map((a) => a - zMean).toList();

  List<SwayData> sways = [];
  for (int i = 0; i < xRms.length; i++) {
    sways.add(SwayData(xRms[i], yRms[i], zRms[i]));
  }
  return sways;
}
