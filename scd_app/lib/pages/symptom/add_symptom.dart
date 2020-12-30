import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/stores/symptom/add_symptom_store.dart';

class AddSymptomPage extends StatelessWidget {
  final AddSymptomStore store = Get.find();
  final TextEditingController _timeController = TextEditingController(text: TimeOfDay.now().format(Get.context));
  final TextEditingController _dateController =
      TextEditingController(text: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add Symptom",
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Observer(
          builder: (_) => Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: FormCard(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(labelText: "Date", border: OutlineInputBorder()),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: FormCard(
                      child: TextField(
                        controller: _timeController,
                        decoration: InputDecoration(labelText: "Time", border: OutlineInputBorder()),
                        readOnly: true,
                        onTap: () {
                          _selectTime(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              FormCard(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Severity"),
                  Slider(
                    activeColor: Colors.red.shade800,
                    inactiveColor: Colors.white,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: store.severity,
                    label: store.severity.round().toString(),
                    onChanged: (double value) {
                      store.severity = value;
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: store.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dateController.text = formatDate(picked, [yyyy, '-', mm, '-', dd]);
      return store.selectedDate = picked;
    }
    return DateTime.now();
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: store.selectedTime);
    if (picked != null) {
      _timeController.text = picked.format(context);
      return store.selectedTime = picked;
    }
    return TimeOfDay.now();
  }
}
