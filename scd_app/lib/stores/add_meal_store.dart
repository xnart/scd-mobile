import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/models/scd_list_model.dart';
import 'package:scd_app/stores/scd_list_store.dart';

part 'add_meal_store.g.dart';

class AddMealStore = _AddMealStore with _$AddMealStore;

abstract class _AddMealStore with Store {
  final SCDListStore scdListStore = Get.find();

  @observable
  TimeOfDay selectedTime = TimeOfDay.now();

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  ObservableSet<SCDListModel> selectedFoods = ObservableSet.of([]);

  @action
  List<SCDListModel> getSuggestions(String text) {
    if (text.isEmpty) return [];
    return scdListStore.foodListFuture.value
        .toSet()
        .difference(selectedFoods)
        .where((element) => element.food.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
