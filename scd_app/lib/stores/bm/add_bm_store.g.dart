// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddBMStore on _AddBMStore, Store {
  final _$selectedTimeAtom = Atom(name: '_AddBMStore.selectedTime');

  @override
  TimeOfDay get selectedTime {
    _$selectedTimeAtom.reportRead();
    return super.selectedTime;
  }

  @override
  set selectedTime(TimeOfDay value) {
    _$selectedTimeAtom.reportWrite(value, super.selectedTime, () {
      super.selectedTime = value;
    });
  }

  final _$selectedDateAtom = Atom(name: '_AddBMStore.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  final _$selectedStoolTypeAtom = Atom(name: '_AddBMStore.selectedStoolType');

  @override
  int get selectedStoolType {
    _$selectedStoolTypeAtom.reportRead();
    return super.selectedStoolType;
  }

  @override
  set selectedStoolType(int value) {
    _$selectedStoolTypeAtom.reportWrite(value, super.selectedStoolType, () {
      super.selectedStoolType = value;
    });
  }

  final _$bloodAtom = Atom(name: '_AddBMStore.blood');

  @override
  bool get blood {
    _$bloodAtom.reportRead();
    return super.blood;
  }

  @override
  set blood(bool value) {
    _$bloodAtom.reportWrite(value, super.blood, () {
      super.blood = value;
    });
  }

  final _$_AddBMStoreActionController = ActionController(name: '_AddBMStore');

  @override
  void save() {
    final _$actionInfo =
        _$_AddBMStoreActionController.startAction(name: '_AddBMStore.save');
    try {
      return super.save();
    } finally {
      _$_AddBMStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTime: ${selectedTime},
selectedDate: ${selectedDate},
selectedStoolType: ${selectedStoolType},
blood: ${blood}
    ''';
  }
}
