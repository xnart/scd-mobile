import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/stores/add_meal_store.dart';

class AddMealPage extends StatelessWidget {
  final AddMealStore store = Get.find();
  final TextEditingController _timeController = TextEditingController(text: TimeOfDay.now().format(Get.context));
  final TextEditingController _dateController =
      TextEditingController(text: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add meal to diary",
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
                      child: formCard(
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
                      child: formCard(
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
                formCard(
                  child: foodField(context),
                ),
                foodListItem(),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {},
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

  Widget foodListItem() {
    if (store.selectedFoods.isEmpty) return SizedBox.shrink();
    return formCard(
      child: Container(
        width: double.infinity,
        child: Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: store.selectedFoods
              .map((e) => Container(
                    width: 150,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            e.food,
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 20,
                              ),
                              onTap: () => {store.selectedFoods.remove(e)})
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget foodField(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(labelText: "Search to add food", border: OutlineInputBorder()),
          controller: _typeAheadController),
      suggestionsCallback: (pattern) {
        return store.getSuggestions(pattern);
      },
      noItemsFoundBuilder: (context) {
        if (_typeAheadController.text.isEmpty) {
          return ListTile(title: Text("Type to search food"));
        }
        return ListTile(title: Text("Food has not found"));
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.food),
        );
      },
      onSuggestionSelected: (suggestion) {
        store.selectedFoods.add(suggestion);
        _typeAheadController.clear();
      },
    );
  }

  Widget formCard({Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
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
