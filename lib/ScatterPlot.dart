/// Scatter plot chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'SwayData.dart';

class SimpleScatterPlotChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleScatterPlotChart(this.seriesList, {this.animate});

  /// Creates a [ScatterPlotChart] with sample data and no transition.
  factory SimpleScatterPlotChart.withUserInfo(List<SwayData> swayDatList) {
    return new SimpleScatterPlotChart(
      convertDataToChartSeries(swayDatList),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(seriesList, animate: animate);
  }

  static List<charts.Series<SwayData, double>> convertDataToChartSeries(
      List<SwayData> swayDatList) {
    return [
      new charts.Series<SwayData, double>(
        id: 'Sales',
        domainFn: (SwayData data, _) => data.x,
        measureFn: (SwayData data, _) => data.z,
        data: swayDatList,
      )
    ];
  }
}
