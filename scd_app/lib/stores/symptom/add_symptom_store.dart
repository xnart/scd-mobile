import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'add_symptom_store.g.dart';

class AddSymptomStore = _AddSymptomStore with _$AddSymptomStore;

abstract class _AddSymptomStore with Store {
  @observable
  TimeOfDay selectedTime = TimeOfDay.now();

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  double severity = 1;
}