import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          primaryXAxis: DateTimeAxis(intervalType: DateTimeIntervalType.days),
          title: ChartTitle(text: 'BM per day'),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryYAxis: NumericAxis(interval: 1),
          series: _getLabelDateTimeAxisSeries()),
    );
  }

  List<ScatterSeries<ChartData, DateTime>> _getLabelDateTimeAxisSeries() {
    HashMap<DateTime, int> dates = HashMap.fromIterable([]);
    store.fetchBMHistoryFuture.value?.forEach((e) {
      var date = DateTime(e.date.year, e.date.month, e.date.day);
      if (dates.containsKey(date)) {
        dates.update(date, (value) => value + 1);
      }
      dates.putIfAbsent(date, () => 1);
    });
    List<ChartData> chartData = [];
    dates.forEach((DateTime key, int value) => chartData.add(ChartData(x: key, y: value)));
    return <ScatterSeries<ChartData, DateTime>>[
      ScatterSeries<ChartData, DateTime>(
          name: "BM Count",
          opacity: 0.8,
          dataSource: chartData,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.zero),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: true),
          color: Colors.brown)
    ];
  }
}

class ChartData {
  ChartData({this.x, this.y});

  final DateTime x;
  final int y;
}
