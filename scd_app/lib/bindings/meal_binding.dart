import 'package:get/get.dart';
import 'package:scd_app/repository/user_repository.dart';
import 'package:scd_app/stores/meal/meal_history_store.dart';

class MealBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(MealHistoryStore());
  }
}