import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/models/scd_list_model.dart';
import 'package:scd_app/pages/scd_food_list.dart';
import 'package:scd_app/pages/scd_table_source.dart';
import 'package:scd_app/repository/scd_repository.dart';

part 'scd_list_store.g.dart';

class SCDListStore = _SCDListStore with _$SCDListStore;

abstract class _SCDListStore with Store {
  SCDRepository scdRepository = Get.find();
  ObservableFuture<List<SCDListModel>> foodListFuture = ObservableFuture.value([]);

  @observable
  String searchText = "";

  @observable
  int sortIndex = 0;

  @observable
  bool ascending = false;

  @computed
  SCDTableSource get tableSource => SCDTableSource(filteredList, onTap: (_) {});

  _SCDListStore() {
    fetchSCDFoods();
  }

  @computed
  List<SCDListModel> get filteredList {
    return foodListFuture?.value
            ?.where((element) => element.food.toLowerCase().contains(searchText.toLowerCase()))
            ?.toList() ??
        [];
  }

  @action
  Future fetchSCDFoods() => foodListFuture = ObservableFuture(scdRepository.fetchSCDFoods());

  @action
  void search(String text) {
    searchText = text;
    SCDFoodListPage.tableKey.currentState.pageTo(0);
  }
}