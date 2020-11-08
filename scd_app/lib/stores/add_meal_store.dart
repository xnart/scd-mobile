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

  @action
  List<SCDListModel> getSuggestions(String text) {
    return scdListStore.foodListFuture.value
        .where((element) => element.food.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
