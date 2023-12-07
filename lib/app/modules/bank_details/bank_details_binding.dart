import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BankRepo(Dio()), permanent: true);
    Get.put(CurrencyRepo(Dio()), permanent: true);
    Get.put(BankDetailsController(
      currencyRepo: Get.find<CurrencyRepo>(),
      bankRepo: Get.find<BankRepo>(),
    ));
  }
}
