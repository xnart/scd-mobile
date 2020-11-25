import 'dart:collection';

import 'package:date_format/date_format.dart';
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
          height: Get.size.height,
          margin: const EdgeInsets.all(5),
          child: FormCard(
            child: SfCalendar(
              view: CalendarView.schedule,
              onTap: (calendarTapDetails) {
                var list = calendarTapDetails.appointments;
                List<Text> texts = List();
                list?.forEach((e) {
                  texts.add(Text("${e.eventName}\n"));
                });
                if (texts.isNotEmpty) {
                  Get.defaultDialog(
                      title: formatDate(calendarTapDetails.date, [yyyy, "-", mm, "-", dd]),
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: texts,
                        ),
                      ));
                }
              },
              scheduleViewSettings: ScheduleViewSettings(
                  hideEmptyScheduleWeek: true,
                  appointmentTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  monthHeaderSettings: MonthHeaderSettings(
                    height: 70,
                  )),
              dataSource: MealDataSource(_getDataSource()),
              showDatePickerButton: true,
            ),
          ),
        ),
      ),
    );
  }

  List<MealEvent> _getDataSource() {
    List<MealModel> list = store.fetchMealHistoryFuture.value;

    return list.map((e) => MealEvent(e.foods.join(", "), e.date, e.date, Color(0xff30343F), true, e)).toList();
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
