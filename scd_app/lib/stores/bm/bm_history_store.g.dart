// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bm_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BMHistoryStore on _BMHistoryStore, Store {
  final _$fetchBMHistoryFutureAtom =
      Atom(name: '_BMHistoryStore.fetchBMHistoryFuture');

  @override
  ObservableFuture<List<BMModel>> get fetchBMHistoryFuture {
    _$fetchBMHistoryFutureAtom.reportRead();
    return super.fetchBMHistoryFuture;
  }

  @override
  set fetchBMHistoryFuture(ObservableFuture<List<BMModel>> value) {
    _$fetchBMHistoryFutureAtom.reportWrite(value, super.fetchBMHistoryFuture,
        () {
      super.fetchBMHistoryFuture = value;
    });
  }

  final _$showBMsAtom = Atom(name: '_BMHistoryStore.showBMs');

  @override
  List<BMModel> get showBMs {
    _$showBMsAtom.reportRead();
    return super.showBMs;
  }

  @override
  set showBMs(List<BMModel> value) {
    _$showBMsAtom.reportWrite(value, super.showBMs, () {
      super.showBMs = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_BMHistoryStore.currentPage');

  @override
  HistoryPage get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(HistoryPage value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_BMHistoryStoreActionController =
      ActionController(name: '_BMHistoryStore');

  @override
  ObservableFuture<dynamic> fetchBMHistory() {
    final _$actionInfo = _$_BMHistoryStoreActionController.startAction(
        name: '_BMHistoryStore.fetchBMHistory');
    try {
      return super.fetchBMHistory();
    } finally {
      _$_BMHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchBMHistoryFuture: ${fetchBMHistoryFuture},
showBMs: ${showBMs},
currentPage: ${currentPage}
    ''';
  }
}
