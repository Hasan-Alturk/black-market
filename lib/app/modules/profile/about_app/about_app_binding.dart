import 'package:black_market/app/modules/profile/about_app/about_app_controller.dart';
import 'package:get/get.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutAppController());
  }
}
