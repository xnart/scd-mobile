import 'package:get/get.dart';
import 'package:scd_app/repository/user_repository.dart';
import 'package:scd_app/stores/bm/add_bm_store.dart';
import 'package:scd_app/stores/bm/bm_history_store.dart';

class BMBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.put(AddBMStore());
    Get.put(BMHistoryStore());
  }
}
