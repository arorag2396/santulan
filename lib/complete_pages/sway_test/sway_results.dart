import 'package:flutter/material.dart';
import 'package:santulan/helper_widgets/sway_test_result.dart';
import 'package:santulan/model/sensor_data_arguments.dart';
import 'package:santulan/model/sensor_data_point.dart';
import 'package:santulan/themes/styling_constants.dart';
import '../../helper_widgets/logo_with_widget.dart';
import 'dart:developer' as developer;

class SwayResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SensorDataArguments sensorDataArguments =
        ModalRoute.of(context).settings.arguments;


    if (sensorDataArguments == null) {
      developer.log("SensorDataArguments should always been selected.");
    }
    if ( sensorDataArguments.sensorDataPoints == null ){
      print("Hell");
      developer.log("SensorDataArguments should always been selected.");
    }
    print(sensorDataArguments.sensorDataPoints);

    final sensorDataPoints = sensorDataArguments == null
        ? [SensorDataPoint(0, 0, 0)]
        : sensorDataArguments.sensorDataPoints;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LogoWithWidget(
        HERO_LOGO_ADDRESS,
        SwayTestResult(sensorDataPoints),
      ),
    );
  }
}
