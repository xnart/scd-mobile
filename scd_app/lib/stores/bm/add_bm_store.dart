import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'add_bm_store.g.dart';

class AddBMStore = _AddBMStore with _$AddBMStore;

abstract class _AddBMStore with Store {
  @observable
  TimeOfDay selectedTime = TimeOfDay.now();

  @observable
  DateTime selectedDate = DateTime.now();
}
