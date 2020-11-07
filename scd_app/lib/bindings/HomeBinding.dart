import 'package:get/get.dart';
import 'package:scd_app/stores/navigation_store.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationStore());
  }
}
