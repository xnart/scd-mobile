// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MealHistoryStore on _MealHistoryStore, Store {
  final _$fetchMealHistoryFutureAtom =
      Atom(name: '_MealHistoryStore.fetchMealHistoryFuture');

  @override
  ObservableFuture<List<MealModel>> get fetchMealHistoryFuture {
    _$fetchMealHistoryFutureAtom.reportRead();
    return super.fetchMealHistoryFuture;
  }

  @override
  set fetchMealHistoryFuture(ObservableFuture<List<MealModel>> value) {
    _$fetchMealHistoryFutureAtom
        .reportWrite(value, super.fetchMealHistoryFuture, () {
      super.fetchMealHistoryFuture = value;
    });
  }

  final _$_MealHistoryStoreActionController =
      ActionController(name: '_MealHistoryStore');

  @override
  ObservableFuture<dynamic> fetchMealHistory() {
    final _$actionInfo = _$_MealHistoryStoreActionController.startAction(
        name: '_MealHistoryStore.fetchMealHistory');
    try {
      return super.fetchMealHistory();
    } finally {
      _$_MealHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchMealHistoryFuture: ${fetchMealHistoryFuture}
    ''';
  }
}
