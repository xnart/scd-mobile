// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_symptom_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddSymptomStore on _AddSymptomStore, Store {
  final _$selectedTimeAtom = Atom(name: '_AddSymptomStore.selectedTime');

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

  final _$selectedDateAtom = Atom(name: '_AddSymptomStore.selectedDate');

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

  final _$severityAtom = Atom(name: '_AddSymptomStore.severity');

  @override
  double get severity {
    _$severityAtom.reportRead();
    return super.severity;
  }

  @override
  set severity(double value) {
    _$severityAtom.reportWrite(value, super.severity, () {
      super.severity = value;
    });
  }

  @override
  String toString() {
    return '''
selectedTime: ${selectedTime},
selectedDate: ${selectedDate},
severity: ${severity}
    ''';
  }
}
