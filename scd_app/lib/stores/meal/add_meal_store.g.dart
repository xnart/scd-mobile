// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddMealStore on _AddMealStore, Store {
  final _$selectedTimeAtom = Atom(name: '_AddMealStore.selectedTime');

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

  final _$selectedDateAtom = Atom(name: '_AddMealStore.selectedDate');

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

  final _$selectedFoodsAtom = Atom(name: '_AddMealStore.selectedFoods');

  @override
  ObservableSet<SCDListModel> get selectedFoods {
    _$selectedFoodsAtom.reportRead();
    return super.selectedFoods;
  }

  @override
  set selectedFoods(ObservableSet<SCDListModel> value) {
    _$selectedFoodsAtom.reportWrite(value, super.selectedFoods, () {
      super.selectedFoods = value;
    });
  }

  final _$_AddMealStoreActionController =
      ActionController(name: '_AddMealStore');

  @override
  List<SCDListModel> getSuggestions(String text) {
    final _$actionInfo = _$_AddMealStoreActionController.startAction(
        name: '_AddMealStore.getSuggestions');
    try {
      return super.getSuggestions(text);
    } finally {
      _$_AddMealStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo =
        _$_AddMealStoreActionController.startAction(name: '_AddMealStore.save');
    try {
      return super.save();
    } finally {
      _$_AddMealStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTime: ${selectedTime},
selectedDate: ${selectedDate},
selectedFoods: ${selectedFoods}
    ''';
  }
}
