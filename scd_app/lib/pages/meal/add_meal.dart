import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/MyAppBar.dart';
import 'package:scd_app/stores/add_meal_store.dart';

class AddMealPage extends StatelessWidget {
  final AddMealStore store = Get.find();
  final TextEditingController _timeController = TextEditingController(text: TimeOfDay.now().format(Get.context));
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add meal to diary",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            formCard(
              child: TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: "Time", border: OutlineInputBorder()),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
            ),
            formCard(
              child: foodField(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodField(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(labelText: "Food", border: OutlineInputBorder()),
          controller: _typeAheadController),
      suggestionsCallback: (pattern) {
        return store.getSuggestions(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.food),
        );
      },
      onSuggestionSelected: (suggestion) {
        this._typeAheadController.text = suggestion.food;
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

  Future<TimeOfDay> _selectDate(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: store.selectedTime);
    if (picked != null) {
      _timeController.text = picked.format(context);
      return store.selectedTime = picked;
    }
    return TimeOfDay.now();
  }
}
