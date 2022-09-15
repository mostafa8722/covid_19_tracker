

import 'package:covid_19_tracker/models/time_series_case.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class Chart extends StatelessWidget{

  final List<charts.Series<TimeSeriesCase,DateTime>> series;
  final bool animate;
  Chart(
      this.series,
      this.animate
      );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return charts.TimeSeriesChart(
      series,
      animate: animate,
      domainAxis:charts.EndPointsTimeAxisSpec() ,
    );
  }
}