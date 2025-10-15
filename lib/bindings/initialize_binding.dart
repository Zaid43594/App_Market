import 'package:get/get.dart';
import 'package:market/core/services/bottom_nav_bar_controller.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController(), permanent: true);
  }
}
