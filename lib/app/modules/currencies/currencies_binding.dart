import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/repo/time_zone_repo.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CurrenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrenciesController(
      timeRepo: Get.put(TimeZoneRepo(dio: Get.find<Dio>())),
      currencyRepo: Get.find<CurrencyRepo>(),
      bankRepo: Get.find<BankRepo>(),
    ));
  }

  void deleteController() {
    Get.delete<CurrenciesController>();
  }
}
