// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on _NavigationStore, Store {
  Computed<HomePages> _$currentPageComputed;

  @override
  HomePages get currentPage =>
      (_$currentPageComputed ??= Computed<HomePages>(() => super.currentPage,
              name: '_NavigationStore.currentPage'))
          .value;

  final _$currentIndexAtom = Atom(name: '_NavigationStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$backStackAtom = Atom(name: '_NavigationStore.backStack');

  @override
  List<int> get backStack {
    _$backStackAtom.reportRead();
    return super.backStack;
  }

  @override
  set backStack(List<int> value) {
    _$backStackAtom.reportWrite(value, super.backStack, () {
      super.backStack = value;
    });
  }

  final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore');

  @override
  void navigateTo(int i) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.navigateTo');
    try {
      return super.navigateTo(i);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateBack(int index) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.navigateBack');
    try {
      return super.navigateBack(index);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
backStack: ${backStack},
currentPage: ${currentPage}
    ''';
  }
}
