import 'package:black_market/app/modules/profile/main_cuurency/main_cuurency_controller.dart';
import 'package:get/get.dart';

class MainCurencyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(MainCurencyController());
  }
}
