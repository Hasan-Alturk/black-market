import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:get/get.dart';

class BankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BankDetailsController());
  }
}
