import 'package:get/get.dart';
import 'package:scd_app/repository/scd_repository.dart';
import 'package:scd_app/stores/connectivity_store.dart';
import 'package:scd_app/stores/navigation_store.dart';
import 'package:scd_app/stores/scd_list_store.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SCDRepository());
    Get.put(NavigationStore());
    Get.put(SCDListStore());
  }
}
