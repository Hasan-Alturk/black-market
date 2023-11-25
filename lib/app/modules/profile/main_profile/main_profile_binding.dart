import 'package:black_market/app/modules/profile/main_profile/main_profile_successfully_controller.dart';
import 'package:get/get.dart';

class MainProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(MainProfileController());
  }
}
