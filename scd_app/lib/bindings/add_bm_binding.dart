import 'package:get/get.dart';
import 'package:scd_app/repository/scd_repository.dart';
import 'package:scd_app/repository/user_repository.dart';
import 'package:scd_app/stores/bm/add_bm_store.dart';
import 'package:scd_app/stores/meal/add_meal_store.dart';
import 'package:scd_app/stores/navigation_store.dart';
import 'package:scd_app/stores/scd_list_store.dart';

class AddBMBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(AddBMStore());
  }
}
