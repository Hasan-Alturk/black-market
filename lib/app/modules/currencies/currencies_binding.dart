import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:get/get.dart';

class CurrenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrenciesController());
  }
}
