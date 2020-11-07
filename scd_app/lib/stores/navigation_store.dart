import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  int currentIndex = 0;

  @observable
  List<int> backStack = [0];

  @computed
  HomePages get currentPage {
    switch (currentIndex) {
      case 0:
        return HomePages.GREETING;
      case 1:
        return HomePages.SCD_LIST;
      default:
        return HomePages.GREETING;
    }
  }

  @action
  void navigateTo(int i) {
    backStack.add(i);
    currentIndex = i;
  }

  @action
  void navigateBack(int index) {
    currentIndex = index;
  }
}

enum HomePages { GREETING, SCD_LIST }
