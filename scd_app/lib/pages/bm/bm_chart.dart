import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scd_app/stores/bm/bm_history_store.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BMChart extends StatelessWidget {
  final BMHistoryStore store = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.context.height / 2,
      child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          title: ChartTitle(text: 'BM per day'),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryYAxis: NumericAxis(interval: 1),
          series: _getLabelDateTimeAxisSeries()),
    );
  }

  List<LineSeries<ChartData, DateTime>> _getLabelDateTimeAxisSeries() {
    HashMap<DateTime, int> dates = HashMap.fromIterable([]);
    store.fetchBMHistoryFuture.value.forEach((e) {
      var date = DateTime(e.date.year, e.date.month, e.date.day);
      dates.putIfAbsent(date, () => 1);
      dates.update(date, (value) => value + 1);
    });
    List<ChartData> chartData = [];
    dates.forEach((DateTime key, int value) => chartData.add(ChartData(x: key, y: value)));
    return <LineSeries<ChartData, DateTime>>[
      LineSeries<ChartData, DateTime>(
          name: "BM Count",
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
          color: const Color.fromRGBO(232, 84, 84, 1))
    ];
  }
}

class ChartData {
  ChartData({this.x, this.y});

  final DateTime x;
  final int y;
}
