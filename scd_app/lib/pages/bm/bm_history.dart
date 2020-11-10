import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/components/my_observer.dart';
import 'package:scd_app/models/bm_model.dart';
import 'package:scd_app/stores/bm/bm_history_store.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BMHistoryPage extends StatelessWidget {
  final BMHistoryStore store = Get.find();

  BMHistoryPage() {
    _init();
  }

  _init() {
    store.fetchBMHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Bowel Movement History",
      ),
      body: MyObserver(
        future: () => store.fetchBMHistoryFuture,
        onRetry: _init,
        builder: (_) => ListView(
          children: [
            Container(
              child: SfCalendar(
                  view: CalendarView.month,
                  dataSource: BMDataSource(_getDataSource()),
                  monthCellBuilder: _monthCellBuilder,
                  onTap: _onTap,
                  monthViewSettings: MonthViewSettings(
                    showTrailingAndLeadingDates: false,
                  )),
            ),
            buildListSection(context)
          ],
        ),
      ),
    );
  }

  void _onTap(CalendarTapDetails details) {
    store.showBMs = details.appointments.map<BMModel>((e) => e.bmModel).toList();
    print(details.appointments);
  }

  Widget buildListSection(BuildContext context) {
    if (store.showBMs.length == 0) return Container();
    return Column(children: [
      Text(
        formatDate(store.showBMs[0].date, [yyyy, "-", mm, "-", dd]),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ...store.showBMs
          .map((e) => e.type != 0
              ? ListTile(
                  title: Text("Type ${e.type}"),
                  trailing: Text(formatDate(e.date, [HH, ":", mm])),
                  subtitle: Text("${e.blood ? "with" : "no"} blood"),
                )
              : SizedBox.shrink())
          .toList()
    ]);
  }

  Widget _monthCellBuilder(BuildContext buildContext, MonthCellDetails details) {
    final Color backgroundColor = _getMonthCellBackgroundColor(details);
    final Color defaultColor = Get.theme.brightness == Brightness.dark ? Colors.black54 : Colors.white;
    return Container(
      decoration: BoxDecoration(color: backgroundColor, border: Border.all(color: defaultColor, width: 0.5)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              details.date.day.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              runSpacing: 3,
              children: [...details.appointments.map((e) => dotCircle(e))],
            )
          ],
        ),
      ),
    );
  }

  Widget dotCircle(BM bm) {
    return Container(
      width: 7.0,
      height: 7.0,
      decoration: new BoxDecoration(
        color: bm.bmModel.blood ? Colors.redAccent : Colors.brown.shade700,
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getMonthCellBackgroundColor(MonthCellDetails details) {
    var bmCount = details.appointments.length;
    if (bmCount == 0) {
      return Colors.grey.shade50;
    } else if (bmCount > 10) {
      return Colors.blue;
    }

    return Colors.blue.withOpacity(bmCount / 10);
  }

  List<BM> _getDataSource() {
    List<BMModel> list = store.fetchBMHistoryFuture.value;

    return list.map((e) => BM("Type ${e.type}", e.date, e.date, Colors.black, false, e)).toList();
  }
}

class BMDataSource extends CalendarDataSource {
  BMDataSource(List<BM> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class BM {
  BM(this.eventName, this.from, this.to, this.background, this.isAllDay, this.bmModel);

  BMModel bmModel;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
