/// Scatter plot chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:santulan/model/sensor_data_point.dart';

class SimpleScatterPlotChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleScatterPlotChart(this.seriesList, {this.animate});

  /// Creates a [ScatterPlotChart] with sample data and no transition.
  factory SimpleScatterPlotChart.withSensorData(
      List<SensorDataPoint> swayDatList) {
    return new SimpleScatterPlotChart(
      convertDataToChartSeries(swayDatList),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(seriesList, animate: animate);
  }

  static List<charts.Series<SensorDataPoint, double>> convertDataToChartSeries(
      List<SensorDataPoint> swayDatList) {
    return [
      new charts.Series<SensorDataPoint, double>(
        id: 'Sway',
        domainFn: (SensorDataPoint data, _) => data.x,
        measureFn: (SensorDataPoint data, _) => data.z,
        data: swayDatList,
      )
    ];
  }
}
