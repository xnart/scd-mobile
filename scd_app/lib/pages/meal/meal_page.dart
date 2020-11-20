import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/components/my_observer.dart';
import 'package:scd_app/models/meal_model.dart';
import 'package:scd_app/stores/meal/meal_history_store.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MealPage extends StatelessWidget {
  final MealHistoryStore store = Get.find();

  MealPage() {
    _init();
  }

  _init() {
    store.fetchMealHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Food Journal"),
      body: MyObserver(
        future: () => store.fetchMealHistoryFuture,
        onRetry: _init,
        builder: (_) => Container(
          margin: const EdgeInsets.all(5),
          child: FormCard(
            child: ListView(
              children: [
                Container(
                  child: SfCalendar(
                      view: CalendarView.month,
                      dataSource: MealDataSource(_getDataSource()),
                      showNavigationArrow: true,
                      monthCellBuilder: _monthCellBuilder,
                      monthViewSettings: MonthViewSettings(
                        showTrailingAndLeadingDates: false,
                      )),
                ),
                // buildListSection(Get.context)
              ],
            ),
          ),
        ),
      ),
    );
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
              children: [...details.appointments.map((e) => dotCircle())],
            )
          ],
        ),
      ),
    );
  }

  Widget dotCircle() {
    return Container(
      width: 7.0,
      height: 7.0,
      decoration: new BoxDecoration(
        color: Colors.brown.shade700,
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

  List<MealEvent> _getDataSource() {
    List<MealModel> list = store.fetchMealHistoryFuture.value;

    return list.map((e) => MealEvent("Type ", e.date, e.date, Colors.black, false, e)).toList();
  }
}

class MealDataSource extends CalendarDataSource {
  MealDataSource(List<MealEvent> source) {
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

class MealEvent {
  MealEvent(this.eventName, this.from, this.to, this.background, this.isAllDay, this.mealModel);

  MealModel mealModel;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
