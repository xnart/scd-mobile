import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/stores/bm/add_bm_store.dart';

class AddBowelMovementPage extends StatelessWidget {
  final TextEditingController _timeController = TextEditingController(text: TimeOfDay.now().format(Get.context));
  final TextEditingController _dateController =
      TextEditingController(text: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  final AddBMStore store = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add BM to diary",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    // store.save();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
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
