import 'package:black_market/app/modules/gold/main_gold_controller.dart';
import 'package:get/get.dart';

class MainGoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainGoldController());
  }
}
