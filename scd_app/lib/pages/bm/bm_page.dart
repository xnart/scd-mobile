import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/pages/bm/bm_calendar.dart';
import 'package:scd_app/stores/bm/bm_history_store.dart';

import 'bm_chart.dart';

class BMPage extends StatelessWidget {
  final BMHistoryStore store = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "BM Journal",
      ),
      bottomNavigationBar: _bottomBar(),
      body: Observer(
        builder: (_) => Container(
          margin: EdgeInsets.all(5),
          child: FormCard(child: _determinePage()),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Observer(
      builder: (_) => SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        currentIndex: store.currentPage.index,
        onTap: (i) => store.currentPage = HistoryPage.values[i],
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Calendar"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text("Chart"),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _determinePage() {
    switch (store.currentPage) {
      case HistoryPage.HISTORY:
        return BMCalendarPage();
      case HistoryPage.CHART:
        return BMChart();
      default:
        return Container();
    }
  }
}
