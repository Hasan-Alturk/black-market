import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:get/get.dart';

class CurrenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrenciesController(
      currencyRepo: Get.find<CurrencyRepo>(),
      bankRepo: Get.find<BankRepo>(),
    ));
  }
  void deleteController() {
    Get.delete<CurrenciesController>();
  }
}
