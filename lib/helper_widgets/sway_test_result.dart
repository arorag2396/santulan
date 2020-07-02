import 'package:flutter/material.dart';
import 'package:santulan/controller/evaluate_sway.dart';
import 'package:santulan/helper_widgets/scatter_plot.dart';
import 'package:santulan/model/sensor_data_point.dart';
import 'package:santulan/themes/styling_constants.dart';
import 'dart:math';

const CARD_TEXT_SIZE = 12.0;
const CARD_HEADING_TEXT_SIZE = 18.0;
const CARD_BORDER_RADIUS = 10.0;

class SwayTestResult extends StatefulWidget {
  final List<SensorDataPoint> sensorDataPoints;
  final SensorDataPoint swayResult;

  SwayTestResult(List<SensorDataPoint> sensorDataPoints)
      : swayResult = calculateSway(sensorDataPoints),
        sensorDataPoints = getRmsData(sensorDataPoints);

  @override
  _SwayTestResultState createState() =>
      _SwayTestResultState(sensorDataPoints, swayResult);
}

class _SwayTestResultState extends State<SwayTestResult> {
  List<SensorDataPoint> sensorDataPoints;
  SensorDataPoint swayResult;

  _SwayTestResultState(this.sensorDataPoints, this.swayResult);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            PADDING_BETWEEN_WIDGET,
          ),
          child: swayTestCards(context),
        ),
      ],
    );
  }

  Widget swayTestCards(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
          getDesiredScreenValue(MediaQuery.of(context).size.height,
              MIN_SCREEN_RATIO, MID_SCREEN_RATIO, MAX_SCREEN_RATIO)),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: PADDING_BETWEEN_WIDGET,
              left: PADDING_BETWEEN_WIDGET/2,
              right: PADDING_BETWEEN_WIDGET,
            ),
            child: Text(
              "Sway Result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: CARD_HEADING_TEXT_SIZE,
              ),
            ),
          ),
          InkWell(
            onTap: null,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height) / 2,
                    child:
                        SimpleScatterPlotChart.withSensorData(sensorDataPoints),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        'X: ${swayResult.x.toStringAsFixed(4)},'
                        'Y:${swayResult.y.toStringAsFixed(4)},'
                        'Z:${swayResult.z.toStringAsFixed(4)}'
                        'Total: ${sqrt(pow(swayResult.x, 2) + pow(swayResult.y, 2) + pow(swayResult.z, 2)).toStringAsFixed(4)}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: CARD_TEXT_SIZE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.fullscreen,
                        color: Colors.blue.shade400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
