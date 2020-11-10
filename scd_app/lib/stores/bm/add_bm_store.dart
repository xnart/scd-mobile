import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/models/bm_model.dart';
import 'package:scd_app/repository/user_repository.dart';

part 'add_bm_store.g.dart';

class AddBMStore = _AddBMStore with _$AddBMStore;

abstract class _AddBMStore with Store {
  final UserRepository userRepository = Get.find();

  @observable
  TimeOfDay selectedTime = TimeOfDay.now();

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  int selectedStoolType;

  @observable
  bool blood = false;

  @action
  void save() {
    var dateTime =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day, selectedTime.hour, selectedTime.minute);
    var bmModel = BMModel(type: selectedStoolType, date: dateTime, blood: blood);
    userRepository.saveBM(bmModel).then((value) => Get.snackbar("Success", "Saved"));
  }
}
