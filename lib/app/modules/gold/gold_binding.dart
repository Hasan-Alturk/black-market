import 'package:black_market/app/modules/gold/gold_controller.dart';
import 'package:get/get.dart';

class GoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoldController());
  }
}
