// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scd_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SCDListStore on _SCDListStore, Store {
  Computed<SCDTableSource> _$tableSourceComputed;

  @override
  SCDTableSource get tableSource => (_$tableSourceComputed ??=
          Computed<SCDTableSource>(() => super.tableSource,
              name: '_SCDListStore.tableSource'))
      .value;
  Computed<List<SCDListModel>> _$filteredListComputed;

  @override
  List<SCDListModel> get filteredList => (_$filteredListComputed ??=
          Computed<List<SCDListModel>>(() => super.filteredList,
              name: '_SCDListStore.filteredList'))
      .value;

  final _$searchTextAtom = Atom(name: '_SCDListStore.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$sortIndexAtom = Atom(name: '_SCDListStore.sortIndex');

  @override
  int get sortIndex {
    _$sortIndexAtom.reportRead();
    return super.sortIndex;
  }

  @override
  set sortIndex(int value) {
    _$sortIndexAtom.reportWrite(value, super.sortIndex, () {
      super.sortIndex = value;
    });
  }

  final _$ascendingAtom = Atom(name: '_SCDListStore.ascending');

  @override
  bool get ascending {
    _$ascendingAtom.reportRead();
    return super.ascending;
  }

  @override
  set ascending(bool value) {
    _$ascendingAtom.reportWrite(value, super.ascending, () {
      super.ascending = value;
    });
  }

  final _$_SCDListStoreActionController =
      ActionController(name: '_SCDListStore');

  @override
  Future<dynamic> fetchSCDFoods() {
    final _$actionInfo = _$_SCDListStoreActionController.startAction(
        name: '_SCDListStore.fetchSCDFoods');
    try {
      return super.fetchSCDFoods();
    } finally {
      _$_SCDListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String text) {
    final _$actionInfo = _$_SCDListStoreActionController.startAction(
        name: '_SCDListStore.search');
    try {
      return super.search(text);
    } finally {
      _$_SCDListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sort(
      Comparable<dynamic> Function(SCDListModel) getField, int i, bool asc) {
    final _$actionInfo =
        _$_SCDListStoreActionController.startAction(name: '_SCDListStore.sort');
    try {
      return super.sort(getField, i, asc);
    } finally {
      _$_SCDListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
sortIndex: ${sortIndex},
ascending: ${ascending},
tableSource: ${tableSource},
filteredList: ${filteredList}
    ''';
  }
}
