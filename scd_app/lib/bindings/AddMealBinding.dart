import 'package:get/get.dart';
import 'package:scd_app/repository/scd_repository.dart';
import 'package:scd_app/stores/add_meal_store.dart';
import 'package:scd_app/stores/navigation_store.dart';
import 'package:scd_app/stores/scd_list_store.dart';

class AddMealBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SCDRepository());
    Get.put(NavigationStore());
    Get.put(SCDListStore());
    Get.put(AddMealStore());
  }
}
