import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/models/meal_model.dart';
import 'package:scd_app/repository/user_repository.dart';

part 'meal_history_store.g.dart';

class MealHistoryStore = _MealHistoryStore with _$MealHistoryStore;

abstract class _MealHistoryStore with Store {
  final UserRepository userRepository = Get.find();

  @observable
  ObservableFuture<List<MealModel>> fetchMealHistoryFuture = ObservableFuture.value([]);

  @action
  ObservableFuture fetchMealHistory() => fetchMealHistoryFuture = ObservableFuture(userRepository.fetchMealHistory());

}